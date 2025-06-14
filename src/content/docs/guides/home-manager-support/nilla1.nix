let
  pins = import ./npins;

  nilla = import pins.nilla;
in
nilla.create ({ config }: {
  includes = [
    "${pins.nilla-home}/modules/home.nix"
  ];

  config = {
    inputs.nixpkgs.src = pins.nixos-unstable;

    homes."username@hostname" = {
      systems = [ "x86_64-linux" ];
      pkgs = config.inputs.nixpkgs.result; # WARN: Unlike nilla-nix/nixos, this doesn't only take in nixpkgs for a single system type
      modules = [
        # Here you can include your Home Manager configuration files or inline modules.
        ./configuration.nix
      ];
    };
  };
})
