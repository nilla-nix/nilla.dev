let
  pins = import ./npins;

  nilla = import pins.nilla;
in
  nilla.create {
    config = {
      # Let's add a new input.
      inputs.my-input = {
        # Set the source of our input to the fetched pin.
        src = pins.my-input;

        # Nilla will automatically set a loader by default, but we can choose one
        # manually if we prefer.
        #
        # Available loaders: nilla, nixpkgs, flake, legacy, raw
        loader = "legacy";

        # Sometimes we want to apply additional configuration to an input. This can
        # be done by giving the loader some settings. Each loader has its own
        # settings schema, so be sure to check the documentation for the loader you
        # are using.
        #
        # In this case we will customize the settings for the legacy loader.
        settings = {
          target = "non-default.nix";

          args = {
            enableFeature = true;
          };
        };
      };
    };
  }
