{ lib, ... }:
{
  imports = [ ./integraciones ];

  options.mestizo256nix = {
    activar = lib.mkEnableOption "Activar mestizo256";
    paleta = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      description = "La paleta a usar";
    };
  };
}
