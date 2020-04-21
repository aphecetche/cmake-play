# Fake project to play with CMake.

Investigate a way to find arrow package, whatever its version (0.14 and 0.16 which splits the 
gandiva part into its own package) is.

Both : 

    cmake $HOME/github.com/aphecetche/cmake-play -Darrow_ROOT=$HOME/alice/cmake/sw/osx_x86-64/arrow/v0.14.1-1/
    cmake $HOME/github.com/aphecetche/cmake-play -Darrow_ROOT=$HOME/alice/cmake/sw/osx_x86-64/arrow/v0.16.0-1/

should get the `arrow::shared` and `arrow::gandiva_shared` targets properly defined.
