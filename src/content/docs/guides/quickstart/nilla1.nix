let
  pins = import ./npins;

  nilla = import pins.nilla;
in
  nilla.create {
    config = {
      # Add Nixpkgs as an input (match the name you used when pinning).
      inputs.nixpkgs.src = pins.nixos-unstable;

      # With a package set defined, we can create a shell.
      shells.default = {
        # Declare what systems the shell can be used on.
        systems = [ "x86_64-linux" ];

        # Define our shell environment.
        shell = { mkShell, hello, ... }:
          mkShell {
            packages = [
              hello
            ];
          };
      };
    };
  }
