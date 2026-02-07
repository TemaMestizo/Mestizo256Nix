{ lib, ... }:
{
  imports = [ ./integraciones ];

  options.mestizo256nix = with lib.types; {
    activar = lib.mkEnableOption "Activar mestizo256";
    paleta = lib.mkOption {
      type = types.attrsOf types.anything;
      description = "La paleta a usar";
    };
  };
}
