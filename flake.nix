{
  description = "Casper Association zero knowledge ACTUS proposal";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      packages.x86_64-linux.default = pkgs.stdenvNoCC.mkDerivation {
        name = "casper-assoc-zk-actus";
        src = ./src;
        nativeBuildInputs = [ (pkgs.texlive.combine { inherit (pkgs.texlive) scheme-basic pgf stmaryrd latexmk; }) ];
        buildPhase = "latexmk -pdf";
        installPhase = ''
          mkdir $out
          install zk-actus.pdf $out/zk-actus.pdf
        '';
      };
    };
}

