{
  config.packages.my-package = {
    systems = [ "x86_64-linux" ];

    package = { stdenv, enableFeatureX, ... }:
      stdenv.mkDerivation {
        /* ... */
      };

    settings = {
      # For the Nixpkgs builder we can specify `args` which are passed to the package function.
      args = {
        enableFeatureX = true;
      };
    };
  };
}
