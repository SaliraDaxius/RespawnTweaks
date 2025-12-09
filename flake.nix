{
  description = "Minecraft 1.20.1 Modding Environment (Fabric/Forge)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          name = "mc-modding-1.20.1";

          buildInputs = [
            pkgs.jdk17
            pkgs.gradle
            pkgs.git
          ];

          # VSCode users — Java support
          nativeBuildInputs = [
            pkgs.jdt-language-server
          ];

          # Quality-of-life environment
          shellHook = ''
            echo "Minecraft 1.20.1 modding environment loaded"
            echo "Using Java: $(java -version 2>&1 | head -n1)"
          '';

          # Gradle caching fix (optional but recommended)
          GRADLE_USER_HOME = ".gradle";
        };
      });
}
