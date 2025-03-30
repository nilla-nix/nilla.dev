let
  # Import pinned inputs.
  pins = import ./npins;

  # Import Nilla.
  nilla = import pins.nilla;
in
  # Create our Nilla project.
  nilla.create {
    # Your project can be configured here.
  }
