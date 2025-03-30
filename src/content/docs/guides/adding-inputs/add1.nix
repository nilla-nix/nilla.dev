let
  pins = import ./npins;

  nilla = import pins.nilla;
in
  nilla.create {
    config = {
      # Add each pin as an input.
      inputs = builtins.mapAttrs (name: value: { src = value; }) pins;
    };
  }
