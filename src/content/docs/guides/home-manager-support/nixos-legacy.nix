{ pkgs, ... }:
let
  # Fetch and import the Nilla NixOS CLI.
  nilla-home = import (pkgs.fetchFromGitHub {
    owner = "nilla-nix";
    repo = "home";
    rev = "v0.1.0-alpha";
    # Try building with this empty hash first. Nix will let you
    # know what the correct hash to use is.
    sha256 = "0000000000000000000000000000000000000000000000000000";
  });
in
{
  # In your system configuration, add Nilla CLI to your system packages.
  environment.systemPackages = [
    nilla-home.packages.default.result.${pkgs.system}
  ];
}
