{ lib, config, ... }:
let
  cfg = config.mestizo256nix;
in
{
  config = lib.mkIf (config.programs.kitty.enable && cfg.activar) {
    programs.kitty.settings =
      with cfg.paleta;
      {
        background = color16;
        foreground = color252;
        cursor = color7;
        selection_background = color53;
        selection_foreground = "none";
      }
      // cfg.paleta;
  };
}
