#include "TFile.h"
#include "TTree.h"
#include "oldA.h"
#include <memory>

int main(int argc, char **argv) {
  std::unique_ptr<TFile> myFile(TFile::Open("old.root", "RECREATE"));
  auto tree = std::make_unique<TTree>("tree", "The Tree Title");

  OLDNAMESPACE::oldA var;
  const int splitlevel = 99; // "all the way"
  tree->Branch("A", &var, splitlevel);

  for (int i = 0; i < 42; ++i) {
    var.id = "A";
    var.run = i;
    var.runnumber = var.run;
    tree->Fill();
  }
  tree->Write();

  return 0;
}
