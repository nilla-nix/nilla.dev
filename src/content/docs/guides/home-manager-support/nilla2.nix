let
  pins = import ./npins;

  nilla = import pins.nilla;
in
nilla.create ({ config }: {
  includes = [
    "${pins.nilla-home}/modules/nixos.nix"
    ...
  ];

  config = {
    inputs.nixpkgs.src = pins.nixos-unstable;

    homes."username@nixos" = {
      systems = [ "x86_64-linux" ];
      modules = [ ... ];
    };

    systems.nixos.example = {
      modules = [ ... ];
      homes = { inherit (config.homes) "username@nixos"; };
    };
  };
})
