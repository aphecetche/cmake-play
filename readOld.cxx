#include "TFile.h"
#include "TTree.h"
#include "oldA.h"
#include <iostream>
#include <memory>

int main(int argc, char **argv) {

  std::unique_ptr<TFile> myFile(TFile::Open(argv[1]));
  auto tree = myFile->Get<TTree>("tree");

  OLDNAMESPACE::oldA *a{nullptr};
  tree->SetBranchAddress("A", &a);

  for (int iEntry = 0; tree->LoadTree(iEntry) >= 0; ++iEntry) {
    tree->GetEntry(iEntry);

    std::cout << "a.id=" << a->id << " a.run=" << a->run
              << " a.runnumber=" << a->runnumber << "\n";
  }
  return 0;
}
