let
  pins = import ./npins;

  nilla = import pins.nilla;
in
nilla.create {
  config = {
    inputs = builtins.mapAttrs
      (name: value: {
        src = value;
      })
      pins;

    shells.default = {
      systems = [ "x86_64-linux" ];

      shell = { mkShell, nodejs, ... }:
        mkShell {
          packages = [
            nodejs
          ];
        };
    };
  };
}
