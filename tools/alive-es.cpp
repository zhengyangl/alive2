// Copyright (c) 2020-present, author: Zhengyang Liu (liuz@cs.utah.edu).
// Distributed under the MIT license that can be found in the LICENSE file.

#include "llvm_util/llvm2alive.h"
#include "ir/type.h"
#include "ir/instr.h"
#include "ir/function.h"
#include "ir/globals.h"
#include "smt/smt.h"
#include "smt/solver.h"
#include "tools/transform.h"
#include "util/config.h"
#include "util/symexec.h"
#include "util/errors.h"

#include "llvm/ADT/Triple.h"
#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/Bitcode/BitcodeReader.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Function.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/PrettyStackTrace.h"
#include "llvm/Support/Signals.h"
#include "llvm/Transforms/Utils/Cloning.h"

#include <unordered_set>
#include <queue>
#include <iostream>

using namespace tools;
using namespace util;
using namespace std;
using namespace llvm_util;

static llvm::cl::OptionCategory opt_alive("Alive options");

static llvm::cl::opt<string>
opt_file1(llvm::cl::Positional, llvm::cl::desc("first_bitcode_file"),
    llvm::cl::Required, llvm::cl::value_desc("filename"),
    llvm::cl::cat(opt_alive));

static llvm::cl::opt<bool> opt_debug(
    "dbg", llvm::cl::desc("Alive: print debugging info"),
    llvm::cl::cat(opt_alive), llvm::cl::init(false));

static llvm::ExitOnError ExitOnErr;

// adapted from llvm-dis.cpp
static std::unique_ptr<llvm::Module> openInputFile(llvm::LLVMContext &Context,
                                                   string InputFilename) {
  auto MB =
    ExitOnErr(errorOrToExpected(llvm::MemoryBuffer::getFile(InputFilename)));
  llvm::SMDiagnostic Diag;
  auto M = getLazyIRModule(move(MB), Diag, Context,
                           /*ShouldLazyLoadMetadata=*/true);
  if (!M) {
    Diag.print("", llvm::errs(), false);
    return 0;
  }
  ExitOnErr(M->materializeAll());
  return M;
}



static void findCands(llvm::Value *Root, std::set<llvm::Value *> &Guesses,
                      unsigned Max) {
  // breadth-first search
  unordered_set<llvm::Value *> Visited;
  queue<llvm::Value *> Q;
  Q.push(Root);
  while (!Q.empty()) {
    llvm::Value *V = Q.front();
    Q.pop();
    if (Visited.insert(V).second) {
      if (auto I = llvm::dyn_cast<llvm::Instruction>(V)) {
        for (auto &Op : I->operands()) {
          Q.push(Op);
        }
      }
      if (llvm::isa<llvm::Constant>(V))
        continue;
      Guesses.insert(V);
      if (Guesses.size() >= Max)
        return;
    }
  }
}

using namespace llvm;
static const std::vector<Instruction::BinaryOps> BinaryOperators = {
  llvm::Instruction::Add, llvm::Instruction::Sub, llvm::Instruction::Mul,
  llvm::Instruction::UDiv, llvm::Instruction::SDiv,
  llvm::Instruction::URem, llvm::Instruction::SRem,
  llvm::Instruction::And, llvm::Instruction::Or,
  llvm::Instruction::Xor, llvm::Instruction::Shl,
  llvm::Instruction::AShr, llvm::Instruction::LShr,
  /*Inst::Eq, Inst::Ne, Inst::Ult,
  Inst::Slt, Inst::Ule, Inst::Sle,
  Inst::SAddSat, Inst::UAddSat,
  Inst::SSubSat, Inst::USubSat,

  Inst::SAddWithOverflow, Inst::UAddWithOverflow,
  Inst::SSubWithOverflow, Inst::USubWithOverflow,
  Inst::SMulWithOverflow, Inst::UMulWithOverflow,
  Inst::SAddO, Inst::UAddO, Inst::SSubO,
  Inst::USubO, Inst::SMulO, Inst::UMulO*/
};

llvm::LLVMContext Context;
static llvm::IRBuilder<> Builder(Context);
static bool getGuesses(const std::set<llvm::Value *> &Inputs,
                       //llvm::Type *T, /*int LHSCost,*/
                       Function &F,
                       std::vector<llvm::Function*> &R,
                       llvm::Instruction *RP,
                       llvm::Module *M){

  auto FT = F.getFunctionType();


  //  Builder.CreateRet(ConstantInt::get(Type::getInt8Ty(Contxt), 0));

  std::vector<llvm::Value *> Comps(Inputs.begin(), Inputs.end());
  for (auto K : BinaryOperators) {
    (void) K;
    for (auto I = Comps.begin(); I != Comps.end(); ++I) {
      if ((*I)->getType() != FT->getReturnType())
        continue;
      for (auto J = Comps.begin(); J != Comps.end(); ++J) {

        if ((*I)->getType() != (*J)->getType())
          continue;


        ValueToValueMapTy VMap;
        auto FC = llvm::CloneFunction(&F, VMap, 0);

        auto Ret = llvm::cast<llvm::Instruction>(VMap[RP]);
        Builder.SetInsertPoint(Ret);
        Value *Bin = Builder.CreateBinOp(K, VMap[*I], VMap[*J]);
        Ret->setOperand(0, Bin);

        R.emplace_back(FC);
      }
    }
  }
  return true;
}

static optional<smt::smt_initializer> smt_init;

// copied from alive-tv.cpp
static bool compareFunctions(llvm::Function &F1, llvm::Function &F2,
                             llvm::Triple &targetTriple, unsigned &goodCount,
                             unsigned &badCount, unsigned &errorCount) {
  TransformPrintOpts print_opts;

  auto Func1 = llvm2alive(F1, llvm::TargetLibraryInfoWrapperPass(targetTriple)
                                    .getTLI(F1));
  if (!Func1) {
    cerr << "ERROR: Could not translate '" << F1.getName().str()
         << "' to Alive IR\n";
    ++errorCount;
    return true;
  }

  auto Func2 = llvm2alive(F2, llvm::TargetLibraryInfoWrapperPass(targetTriple)
                                    .getTLI(F2), Func1->getGlobalVarNames());
  if (!Func2) {
    cerr << "ERROR: Could not translate '" << F2.getName().str()
         << "' to Alive IR\n";
    ++errorCount;
    return true;
  }

  smt_init->reset();
  Transform t;
  t.src = move(*Func1);
  t.tgt = move(*Func2);
  TransformVerify verifier(t, false);
  t.print(cout, print_opts);

  {
    auto types = verifier.getTypings();
    if (!types) {
      cerr << "Transformation doesn't verify!\n"
              "ERROR: program doesn't type check!\n\n";
      ++errorCount;
      return true;
    }
    assert(types.hasSingleTyping());
  }

  Errors errs = verifier.verify();
  bool result(errs);
  if (result) {
    if (errs.isUnsound()) {
      cerr << "Transformation doesn't verify!\n" << errs << endl;
      ++badCount;
    } else {
      cerr << errs << endl;
      ++errorCount;
    }
  } else {
    cerr << "Transformation seems to be correct!\n\n";
    ++goodCount;
  }

  return result;
}

int main(int argc, char **argv) {
  llvm::sys::PrintStackTraceOnErrorSignal(argv[0]);
  llvm::PrettyStackTraceProgram X(argc, argv);
  llvm::EnableDebugBuffering = true;
  llvm::llvm_shutdown_obj llvm_shutdown;  // Call llvm_shutdown() on exit.


  llvm::cl::ParseCommandLineOptions(argc, argv,
                                    "Alive2 stand-alone enumerative synthesizer\n");

  auto M1 = openInputFile(Context, opt_file1);

  if (!M1.get())
    llvm::report_fatal_error(
      "Could not read bitcode from '" + opt_file1 + "'");

  auto &DL = M1.get()->getDataLayout();
  auto targetTriple = llvm::Triple(M1.get()->getTargetTriple());

  M1->dump();

  llvm::Function &F1 = *(M1.get()->getFunction("foo"));

  std::set<llvm::Value *> Cands;
  llvm::Instruction *ReturnPoint = nullptr;
  for (auto &BB : F1) {
    for (auto &I : BB) {
      if (llvm::isa<llvm::ReturnInst>(I)) {
        ReturnPoint = &I;
        findCands(&I, Cands, 10);
      }
    }
  }

  cerr<<"; candidates = {"<<endl;

  for (auto &I : Cands) {
    I->print(llvm::errs());
    llvm::errs()<<",\n";
  }
  cerr<<"}."<<endl;

  std::vector<llvm::Function *> R;
  getGuesses(Cands, F1, R, ReturnPoint, M1.get());

  llvm_util::initializer llvm_util_init(cerr, DL);
  smt_init.emplace();


  bool result = false;
  unsigned goodCount = 0, badCount = 0, errorCount = 0;
  llvm::Function *RHS = nullptr;
  for (auto &I : R) {

    result |= compareFunctions(F1, *I, targetTriple, goodCount, badCount,
                               errorCount);
    RHS = I;

    if (goodCount)
      break;
  }


  if (RHS) {
    cerr<<"; RHS found"<<endl;
    RHS->dump();
    return 0;
  }



  return 1;
}
