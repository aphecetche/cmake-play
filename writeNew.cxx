#include "TFile.h"
#include "TTree.h"
#include "newA.h"
#include <memory>

int main(int argc, char **argv) {
  std::unique_ptr<TFile> myFile(TFile::Open("new.root", "RECREATE"));
  auto tree = std::make_unique<TTree>("tree", "The Tree Title");

  NEWNAMESPACE::newA var;
  const int splitlevel = 99; // "all the way"
  tree->Branch("A", &var, splitlevel);

  for (int i = 0; i < 42; ++i) {
    var.id = "A";
    var.run = i;
    tree->Fill();
  }
  tree->Write();

  return 0;
}
