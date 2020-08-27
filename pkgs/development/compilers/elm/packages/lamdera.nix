{ stdenv, lib
, fetchurl
, autoPatchelfHook
, zlib, gmp, ncurses5
}:

stdenv.mkDerivation rec {
  pname = "lamdera";
  version = "0.12";

  src = fetchurl {
    url = "https://static.lamdera.com/bin/linux/lamdera";
    sha256 = "0vmm6gbb6hsr73vgfhmqqjb0ggh296bjwb9rrjhymkv5a09avixd";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  unpackPhase = "cp $src lamdera";

  buildInputs = [
    zlib
    gmp
    ncurses5
  ];

  installPhase = ''
    install -m755 -D lamdera $out/bin/lamdera
  '';

  meta = with lib; {
    homepage = https://lamdera.app;
    description = "A new set of primitives for web development";
    platforms = platforms.linux;
    maintainers = with maintainers; [ Zimmi48 ];
  };
}
