{ lib, ... }:
{
  imports = [ ./integraciones ];

  options.mestizo256nix = with lib.types; {
    activar = lib.mkEnableOption "Activar mestizo256";
    paleta = lib.mkOption {
      type = types.attrsOf (
        lib.mkOption {
          type = types.str;
          description = "Uno de los 256 colores de la paleta";
        }
      );
      description = "La paleta a usar";
    };
  };
}
