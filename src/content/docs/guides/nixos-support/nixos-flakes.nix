{
  description = "My Flake that contains my NixOS system configuration.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Add the Nilla NixOS CLI as an input in your flake.
    nilla-nixos.url = "github:nilla-nix/nixos";
  };

  outputs = { nixpkgs, nilla-nixos, ... }: {
    nixosConfigurations.myhost = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./configuration.nix
        ./hardware-configuration.nix

        # Add an additional module to your system configuration.
        ({ pkgs, ... }: {
          environment.systemPackages = [
            # Add the Nilla CLI to your system packages.
            nilla-nixos.packages.${pkgs.system}.default
          ];
        })
      ];
    };
  };
}
