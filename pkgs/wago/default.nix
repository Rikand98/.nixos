{ stdenv, fetchFromGitHub, ... }:

stdenv.mkDerivation {
  pname = "wago.io";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "methodgg";
    repo = "wago.io";
    rev = "c5e2824ab19c46c5160374e516ab4e81f67d1447";
    sha256 = "sha256-c5e2824ab19c46c5160374e516ab4e81f67d1447";
  };

  buildInputs = [ ];

  buildPhase = ''
    make release
  '';

  installPhase = ''
    mkdir -p $out/bin
    make install INSTALL_DIR=$out/bin
    chmod +x $out/bin/2048
  '';
  }
