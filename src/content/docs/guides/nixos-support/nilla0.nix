let
  pins = import ./npins;

  nilla = import pins.nilla;
in
  nilla.create {
    includes = [
      "${pins.nilla-nixos}/modules/nixos.nix"
    ];
  }
