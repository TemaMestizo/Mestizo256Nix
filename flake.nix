{
  description = "Un tema oscuro para los que no salen de casa";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=26.05";
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

      moduloHM = ./src/modulo.nix;
      paletas = {
        mestizo = import ./src/paletas/mestizo.nix;
        gruvbox = import ./src/paletas/gruvbox.nix;
      };
    };
}
