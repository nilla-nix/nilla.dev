{ config }:
{
  config.shells.my-shell = {
    systems = [ "x86_64-linux" ];

    shell = { mkShell, bun, ... }:
      mkShell {
        packages = [
          bun
        ];
      };

    # We can customize how the builder builds our shell with the `settings` option.
    settings = {
      # One option that the Nixpkgs builder provides is `pkgs` which allows us to
      # choose the package set that will be used to build our shell.
      #
      # In this example we will tell the builder to use the loaded `nixpkgs-unstable`
      # package set.
      pkgs = config.inputs.nixpkgs-unstable.result;
    };
  };
}
