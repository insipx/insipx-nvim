let
  nixpkgs = import <nixpkgs> { overlays = [ (import <rust-overlay>) ]; };
  unstable = import (fetchTarball "channel:nixos-unstable") { };
in with nixpkgs;
stdenvNoCC.mkDerivation {
  name = "efinity-env";
  buildInputs = [
    luarocks
    luaformatter

    gcc
    openssl
    pkgconfig
    nasm
    cmake
    zlib
    llvmPackages.clang
    llvmPackages.libclang
    libbfd
    libopcodes
    libunwind
    autoconf
    automake
    libtool
    libuuid
  ];

  LIBCLANG_PATH = "${llvmPackages.libclang.lib}/lib";
  PROTOC = "${protobuf}/bin/protoc";
  LD_LIBRARY_PATH = "${nixpkgs.lib.makeLibraryPath [ nixpkgs.libuuid ]}";
  NIX_LD_LIBRARY_PATH =
    lib.makeLibraryPath [ stdenv.cc.cc openssl gcc llvmPackages.libclang ];
  NIX_LD = builtins.readFile "${stdenv.cc}/nix-support/dynamic-linker";
}
