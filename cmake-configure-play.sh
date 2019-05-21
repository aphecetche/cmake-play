#!/usr/bin/env sh

REF=~/alice/tests/sw/osx_x86-64


cmd=$( cat << EOF 
cmake \
  -DCMAKE_INSTALL_PREFIX=~/alice/tests/standalone/cmake-play/install \
  -S ~/alice/tests/standalone/cmake-play/  \
  -B ~/alice/tests/standalone/cmake-play/build \
  -DGeant4_ROOT=$REF/GEANT4/latest \
  -DROOT_ROOT=$REF/ROOT/latest \
  -G Ninja
EOF
)

echo $cmd
eval "$cmd"
