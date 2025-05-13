# We can install the package imperatively.
nix profile install github:nilla-nix/nixos

# Or we can run the Nilla NixOS CLI directly on-demand.
nix run github:nilla-nix/nixos -- --help
