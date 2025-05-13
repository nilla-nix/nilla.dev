let
  pins = import ./npins;

  nilla = import pins.nilla;
in
nilla.create {
  config = {
    inputs = builtins.mapAttrs
      (name: value: {
        src = value;
      })
      pins;

    shells.default = {
      systems = [ "x86_64-linux" ];

      shell = { mkShell, nodejs, ... }:
        mkShell {
          packages = [
            nodejs
          ];
        };
    };

    packages = rec {
      default = nilla-dev;

      nilla-dev = {
        systems = [ "x86_64-linux" ];

        package = { buildNpmPackage, importNpmLock, pkg-config, python3, vips, ... }:
          buildNpmPackage {
            pname = "nilla-dev";
            version = "unstable";

            src = ./.;

            npmInstallFlags = [ "--legacy-peer-deps" ];

            buildInputs = [ vips ];
            nativeBuildInputs = [ pkg-config python3 ];

            npmDeps = importNpmLock {
              npmRoot = ./.;
            };

            npmConfigHook = importNpmLock.npmConfigHook;

            installPhase = ''
              mv dist $out
            '';
          };
      };
    };
  };
}
