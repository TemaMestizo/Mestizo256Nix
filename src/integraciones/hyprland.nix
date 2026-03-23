{
  lib,
  config,
  ...
}:
let
  cfg = config.mestizo256nix;
in
{
  config = lib.mkIf (config.wayland.windowManager.hyprland.enable && cfg.activar) {
    wayland.windowManager.hyprland.settings =
      let
        f = cadena: builtins.substring 1 (-1) cadena;
      in
      with cfg.paleta;
      {
        general = {
          "col.active_border" = "rgb(${f color92})";
          "col.inactive_border" = "rgb(${f color238})";
          border_size = 4;
        };
        group = {
          "col.border_active" = "rgb(${f color1})";
          "col.border_inactive" = "rgb(${f color209})";
          "col.border_locked_active" = "rgb(${f color6})";
          "col.border_locked_inactive" = "rgb(${f color4})";
          groupbar = {
            "col.active" = "rgb(${f color1})";
            "col.inactive" = "rgb(${f color209})";
            "col.locked_active" = "rgb(${f color6})";
            "col.locked_inactive" = "rgb(${f color39})";
            text_color = "rgb(${f color252})";
          };
        };
      };
  };
}
