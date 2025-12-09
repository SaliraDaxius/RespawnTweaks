{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    jdk17
    gradle
    git

    # GLFW
    libGL
    xorg.libX11
    xorg.libXcursor
    xorg.libXext
    xorg.libXrandr
    xorg.libXxf86vm
  ];

  # Optional: Make Gradle downloads persist across shells
  GRADLE_USER_HOME = "./.gradle";
}
