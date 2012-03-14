{stdenv, fetchurl
, cmake, mesa, zlib, python, expat, libxml2, libsigcxx, libuuid, freetype
, libpng, boost, doxygen, cairomm, pkgconfig, imagemagick, libjpeg, libtiff
, gettext, intltool, perl, gtkmm, glibmm, gtkglext
}:

stdenv.mkDerivation rec {
  version = "0.8.0.2";
  name = "k3d-${version}";
  src = fetchurl {
    url = "mirror://sourceforge/k3d/k3d-source-0.8.0.2.tar.bz2";
    sha256 = "01fd2qb0zddif3wz1a2wdmwyzn81cf73678qp2gjs8iikmdz6w7x";
  };

  patches = map fetchurl (import ./debian-patches.nix);

  preConfigure = ''
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH''${LD_LIBRARY_PATH:+:}$PWD/build/lib"
  '';

  buildInputs = [
     cmake mesa zlib python expat libxml2 libsigcxx libuuid freetype libpng
     boost doxygen cairomm pkgconfig imagemagick libjpeg libtiff gettext
     intltool perl
     gtkmm glibmm gtkglext 
    ];

  doCheck = false;

  meta = {
    description = "A 3D editor with support for procedural editing";
    homepage = "http://k-3d.org/";
    platforms = with stdenv.lib.platforms;
      linux;
    maintainers = with stdenv.lib.maintainers; 
      [raskin];
  };
}
