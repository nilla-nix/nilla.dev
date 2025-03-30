{
  # We declare our package as `my-package`.
  config.packages.my-package = {
    # Now we set the list systems that the package will be built for.
    systems = [ "x86_64-linux" ];

    # Finally, we need to provide a function that takes in a package set (Nixpkgs) and
    # produces a package.
    package = { stdenv, fetchFromGitHub, waylandpp, ... }:
      # This function returns a built package. You can use Nixpkgs-provided tools to
      # create one!
      stdenv.mkDerivation {
        src = fetchFromGitHub { /* ... */ };
        buildInputs = [ waylandpp ];
      };
  };
}
