{ lib, config }:
{
  imports = [ ./integraciones ];

  options.mestizo256 = with lib.types; {
    activar = lib.mkEnableOption "Activar mestizo256";
    paleta =
      lib.range 1 255
      |> map (n: {
        "color${builtins.toString n}" = {
          type = types.str;
          description = "Uno de los 256 colores de la paleta";
        };
      })
      |> lib.mergeAttrsList;
  };
}
