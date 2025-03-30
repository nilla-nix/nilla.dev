{
  config.shells.my-shell = {
    systems = [ "x86_64-linux" ];

    shell = { mkShell, enableFeatureX, ... }:
      mkShell {
        /* ... */
      };

    settings = {
      # For the Nixpkgs builder we can specify `args` which are passed to the shell function.
      args = {
        enableFeatureX = true;
      };
    };
  };
}
