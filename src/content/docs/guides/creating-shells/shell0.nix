{
  # We declare our shell as `my-shell`.
  config.shells.my-shell = {
    # Now we set the list systems that the shell will be built for.
    systems = [ "x86_64-linux" ];

    # Finally, we need to provide a function that takes in a package set (Nixpkgs) and
    # produces a shell.
    shell = { mkShell, bun, ... }:
      # This function returns a built shell. You can use Nixpkgs-provided tools to
      # create one!
      mkShell {
        packages = [
          bun
        ];
      };
  };
}
