# We can install the package imperatively.
nix profile install github:nilla-nix/cli

# Or we can run the Nilla CLI directly on-demand.
nix run github:nilla-nix/cli -- --help
