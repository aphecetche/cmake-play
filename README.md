# Fake project to play with CMake.

Investigate find_package(boost ...) options, depending on the presence of system boost (e.g. from brew)

## cmake with no option

Finds the brew version :

    [ cmake ]~/tmp/build-cmake-play$ rm -rf * && cmake $HOME/github.com/aphecetche/cmake-play
    -- The CXX compiler identification is AppleClang 11.0.3.11030032
    ...
    -- Found Boost: /usr/local/lib/cmake/Boost-1.72.0/BoostConfig.cmake (found suitable version "1.72.0", minimum required is "1.70")
    ...

## cmake with -DBoost_ROOT=

It still finds the brew version, which might be unexpected.

    [ cmake ]~/tmp/build-cmake-play$ rm -rf * && cmake $HOME/github.com/aphecetche/cmake-play -DBoost_ROOT=/Users/laurent/alice/cmake/sw/osx_x86-64/boost/latest
    -- Found Boost: /usr/local/lib/cmake/Boost-1.72.0/BoostConfig.cmake (found suitable version "1.72.0", minimum required is "1.70")

But it probably makes sense because in the alibuild version of Boost all the cmake goodies have been removed, see in [boost.sh](https://github.com/alisw/alidist/blob/master/boost.sh#L103) recipe :

    # Remove CMake Config files, some of our dependent packages pick them up, but fail to use them
    # So for now we rely on the boost module FindBoost which comes with CMake
    rm -Rf "$INSTALLROOT"/lib/cmake

So the brew version is likely a better match as far as CMake is concerned, which can be checked by setting the `Boost_DEBUG` variable to ON in order to get some more information from CMake internal FindBoost module.

    [ cmake ]~/tmp/build-cmake-play$ rm -rf * && cmake $HOME/github.com/aphecetche/cmake-play -DBoost_ROOT=/Users/laurent/alice/cmake/sw/osx_x86-64/boost/latest -DBoost_DEBUG=ON
    -- Found Boost 1.72.0 at /usr/local/lib/cmake/Boost-1.72.0
    --   Requested configuration: QUIET
    -- BoostConfig: find_package(boost_headers 1.72.0 EXACT CONFIG  QUIET HINTS /usr/local/lib/cmake)
    -- Found boost_headers 1.72.0 at /usr/local/lib/cmake/boost_headers-1.72.0
    -- Found Boost: /usr/local/lib/cmake/Boost-1.72.0/BoostConfig.cmake (found suitable version "1.72.0", minimum required is "1.70")

This can also be confirmed by commentingout  the removal line (`rm -RF "$INSTALLROOT"/lib/cmake`) from the boost.sh alidist recipe and rebuilding the alibuild boost... And sure enough now CMake is finding "our" boost. 

    [ cmake ]~/tmp/build-cmake-play$ rm -rf * && cmake $HOME/github.com/aphecetche/cmake-play -DBoost_ROOT=/Users/laurent/alice/cmake/sw/osx_x86-64/boost/latest
    -- Found Boost 1.70.0 at /Users/laurent/alice/cmake/sw/osx_x86-64/boost/latest/lib/cmake/Boost-1.70.0
    --   Requested configuration: QUIET
    -- Found boost_headers 1.70.0 at /Users/laurent/alice/cmake/sw/osx_x86-64/boost/latest/lib/cmake/boost_headers-1.70.0
    -- Found Boost: /Users/laurent/alice/cmake/sw/osx_x86-64/boost/latest/lib/cmake/Boost-1.70.0/BoostConfig.cmake (found suitable version "1.70.0", minimum required is "1.70")

Even with an installed boost version with a proper CMake config file, it is possible to ignore it by setting the `Boost_NO_BOOST_CMAKE` variable to ON, in which case our Boost_ROOT still takes precedence over the brew one.

    [ cmake ]~/tmp/build-cmake-play$ rm -rf * && cmake $HOME/github.com/aphecetche/cmake-play -DBoost_ROOT=/Users/laurent/alice/cmake/sw/osx_x86-64/boost/latest -DBoost_NO_BOOST_CMAKE=ON
    -- Found Boost: /Users/laurent/alice/cmake/sw/osx_x86-64/boost/latest/include (found suitable version "1.70.0", minimum required is "1.70")
    [ cmake ]~/tmp/build-cmake-play$ rm -rf * && cmake $HOME/github.com/aphecetche/cmake-play -DBoost_NO_BOOST_CMAKE=ON   zsh: sure you want to delete all 4 files in /Users/laurent/tmp/build-cmake-play [yn]? y
    -- Found Boost: /usr/local/include (found suitable version "1.72.0", minimum required is "1.70")

> So instead of "mutilating" our boost version (by removing its installed lib/cmake directory), we should probably add the `-DBoost_NO_BOOST_CMAKE=ON` option in the recipes of the packages that cannot work correctly with `BoostConfig.cmake`, but let the majority of the package work the way it's intended ?
