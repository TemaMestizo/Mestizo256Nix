{ lib, config, ... }:
let
  paleta = config.mestizo256.paleta;
in
{
  config = lib.mkIf (config.programs.kitty.enable && config.mestizo256nix.activar) {
    programs.kitty.settings =
      with paleta;
      {
        background = color16;
        foreground = color252;
        cursor = color7;
        selection_background = color53;
        selection_foreground = "none";
      }
      // paleta;
  };
}
