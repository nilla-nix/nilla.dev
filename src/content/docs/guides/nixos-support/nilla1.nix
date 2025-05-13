let
  pins = import ./npins;

  nilla = import pins.nilla;
in
nilla.create ({ config }: {
  includes = [
    "${pins.nilla-nixos}/modules/nixos.nix"
  ];

  config = {
    inputs.nixpkgs.src = pins.nixos-unstable;

    systems.nixos.example = {
      pkgs = config.inputs.nixpkgs.result.x86_64-linux;
      modules = [
        # Here you can include your NixOS configuration files or inline modules.
        ./configuration.nix
      ];
    };
  };
})
