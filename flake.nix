{
  description = "Un tema oscuro para los que no salen de casa";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.11";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          nixd
          nil
          nixfmt
        ];
      };

      homeManagerModules.default = import ./src/modulo.nix;
      paletas.mestizo = import ./src/paletas/mestizo.nix;
    };
}
