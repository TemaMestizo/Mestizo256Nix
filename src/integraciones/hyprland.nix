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
        f = cadena: "rgb(${builtins.substring 1 (-1) cadena})";
        colorActivo = f cfg.paleta.color1;
        colorInactivo = f cfg.paleta.color238;
        colorActivoBloqueado = f cfg.paleta.color2;
        colorInactivoBloqueado = f cfg.paleta.color118;
      in
      with cfg.paleta;
      {
        general = {
          "col.active_border" = colorActivo;
          "col.inactive_border" = colorInactivo;
        };
        group = {
          "col.border_active" = colorActivo;
          "col.border_inactive" = colorInactivo;
          "col.border_locked_active" = colorActivoBloqueado;
          "col.border_locked_inactive" = colorInactivoBloqueado;
          groupbar = {
            "col.active" = colorActivo;
            "col.inactive" = f color0;
            "col.locked_active" = colorActivoBloqueado;
            "col.locked_inactive" = colorInactivoBloqueado;
            text_color = f color252;
          };
        };
      };
  };
}
