{
  description = "Development Shell for MEEQ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      ( system:
        let 
          pkgs = import nixpkgs { inherit system; };
        in
        with pkgs;
        {
          devShells.default = mkShell {
            buildInputs = [
              terraform
              terraform-ls
              awscli2

              stdenv.cc.cc.lib
            ];
          };

          shellHook = ''
            alias pulumi="poetry run pulumi"
            export PATH=${pkgs.lib.makeLibraryPath [
              pkgs.stdenv.cc.cc
            ]}:$PATH
          '';
        }
      );
}
