# Multiple goal project
Project to learn how to use rocket 
and to cross compile to another environment
and deploy the project to kubernetes via helm

## Setup
The rocket library uses the nightly version from rustc therefore we configure to use the nightly build
in this directory only.
`rustup override set nightly`

## Cross compile
add installation of standard library for target architecture.
Here we use the architecture for an raspberry pi 2/3/4
`rustup target add armv7-unknown-linux-gnueabihf`

Normally we good use "cross" but this doesnt work on macbooks with M1 chip.
Here we need to do it in another way.
First we need to install the toolchain for the raspberry:

```
# add repository to brew
brew tap messense/macos-cross-toolchains
# install armv7-unknown-linux-gnueabihf toolchain
brew install armv7-unknown-linux-gnueabihf
```

Then we need to set some environment variables for the rust compiler.

```
TARGET=armv7-unknown-linux-gnueabihf
export TARGET_CC=$TARGET-gcc
export TARGET_AR=$TARGET-ar
export CC_armv7_unknown_linux_gnu=$TARGET-gcc
export CXX_armv7_unknown_linux_gnu=$TARGET-g++
export AR_armv7_unknown_linux_gnu=$TARGET-ar
export CARGO_TARGET_ARMV7_UNKNOWN_LINUX_GNUEABIHF_LINKER=$TARGET-gcc
export CMAKE_TOOLCHAIN_FILE_armv7_unknown_linux_gnueabihf=$(pwd)/wip/armv7.cmake
```

Then we can finally start with the cross compilation.

```
cargo build --release --target $TARGET
```

To easier compilation add this to your ~.cargo/config.toml

```
[alias]
b = "build"
c = "check"
t = "test"
r = "run"
rr = "run --release"
# for raspberry pi
bpi = "build --target armv7-unknown-linux-gnueabihf"
brpi = "build --release --target armv7-unknown-linux-gnueabihf"
```

## helm deployment