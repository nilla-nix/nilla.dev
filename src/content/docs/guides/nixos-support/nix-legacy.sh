# We'll install the Nilla NixOS CLI package for your system architecture.
system=$(nix-instantiate --eval --expr 'builtins.currentSystem' | tr -d '"')

# Install the package imperatively.
nix-env -iA packages.default.result.${system} https://github.com/nilla-nix/nixos/archive/main.tar.gz
