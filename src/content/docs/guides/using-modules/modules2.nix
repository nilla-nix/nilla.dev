let
  pins = import ./npins;

  nilla = import pins.nilla;
in
nilla.create {
  includes = [
    # Add any of the modules you want to use here.

    # For example, we can add the module defined in `my-module.nix` via a path.
    ./my-module.nix

    # Or we can define a module inline.
    { config = { }; }
  ];
}
