{ lib, ... }:
{
  imports = [ ./integraciones ];

  options.mestizo256nix = with lib.types; {
    activar = lib.mkEnableOption "Activar mestizo256";
    paleta = types.attrsOf (
      lib.mkOption {
        type = types.str;
        description = "Uno de los 256 colores de la paleta";
      }
    );
  };
}
