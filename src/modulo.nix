{ lib, ... }:
{
  imports = [ ./integraciones ];

  options.mestizo256nix = {
    activar = lib.mkEnableOption "Activar mestizo256";
    paleta = lib.mkOption {
      type = lib.types.submodule {
        options =
          256
          |> lib.lists.genList (
            numero:
            let
              n = lib.toString numero;
            in
            {
              name = "color${n}";
              value = lib.mkOption {
                description = "El color ${n}";
                type = lib.types.str;
              };
            }
          )
          |> lib.listToAttrs;
      };
      description = "La paleta a usar";
    };
  };
}
