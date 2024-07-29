{
  description = "TTP Showcase flake using C++";

  inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };
  outputs = {self, nixpkgs, ...}:
  let system = "x86_64-linux"; in
  {
    devShells."${system}".default =
    let
      pkgs = import nixpkgs {inherit system; };
      build_inp = with pkgs; [
        pkg-config
        cmake
        libgcc
      ];
    in pkgs.mkShell
    {
      packages = with pkgs; [
        bashInteractive
        pkg-config
      ];

      buildInputs = build_inp;
    };
  };
}
