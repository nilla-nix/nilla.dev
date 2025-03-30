{ pkgs, ... }:
let
  # Fetch and import the Nilla CLI.
  nilla-cli = import (pkgs.fetchFromGitHub {
    owner = "nilla-nix";
    repo = "cli";
    rev = "v0.0.0-alpha.8";
    # Try building with this empty hash first. Nix will let you
    # know what the correct hash to use is.
    sha256 = "0000000000000000000000000000000000000000000000000000";
  });
in
{
  # In your system configuration, add Nilla CLI to your system packages.
  environment.systemPackages = [
    nilla-cli.packages.default.result.${pkgs.system}
  ];
}
