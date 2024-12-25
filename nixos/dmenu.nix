{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "dmenu";
  version = "1.0";  # Update the version accordingly

  src = ./src/dmenu;  # Path to your modified source, or use a git repo

  buildInputs = with pkgs; [ gcc gnumake xorg.libX11 xorg.libXinerama xorg.libXft ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp dmenu $out/bin
    cp stest $out/bin
    runHook postInstall
  '';
}
