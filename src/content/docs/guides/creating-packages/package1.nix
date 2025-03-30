{ config }:
{
  config.packages.my-package = {
    systems = [ "x86_64-linux" ];

    package = { stdenv, fetchFromGitHub, waylandpp, ... }:
      stdenv.mkDerivation {
        src = fetchFromGitHub { /* ... */ };
        buildInputs = [ waylandpp ];
      };

    # We can customize how the builder builds our package with the `settings` option.
    settings = {
      # One option that the Nixpkgs builder provides is `pkgs` which allows us to
      # choose the package set that will be used to build our package.
      #
      # In this example we will tell the builder to use the loaded `nixpkgs-unstable`
      # package set.
      pkgs = config.inputs.nixpkgs-unstable.result;
    };
  };
}
