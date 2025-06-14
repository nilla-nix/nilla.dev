# We can install the package imperatively.
nix profile install github:nilla-nix/home

# Or we can run the Nilla Home CLI directly on-demand.
nix run github:nilla-nix/home -- --help
