let
  pins = import ./npins;

  nilla = import pins.nilla;
in
  # We'll adjust our call to `nilla.create` to be a function so we can access module
  # arguments like `config`.
  nilla.create ({ config }:
    let
      # Access the loaded form of `my-input`.
      my-input = config.inputs.my-input.result;
    in
    {
      config = {
        inputs = builtins.mapAttrs (name: value: { src = value; }) pins;
      };
    }
  )
