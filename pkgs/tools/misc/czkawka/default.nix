{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, glib
, cairo
, pango
, gdk-pixbuf
, atk
, gtk3
}:

rustPlatform.buildRustPackage rec {
  pname = "czkawka";
  version = "3.0.0";

  src = fetchFromGitHub {
    owner = "qarmin";
    repo = pname;
    rev = version;
    sha256 = "1g5a9ns5lkiyk6hjsh08hgs41538dzj0a4lgn2c5cbad5psl0xa6";
  };

  cargoSha256 = "03y7grvnp1y6h8phdb0z1y3mwwbamvcbgmr2h707qvszga4yz9rq";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    glib
    cairo
    pango
    gdk-pixbuf
    atk
    gtk3
  ];

  meta = with lib; {
    description = "A simple, fast and easy to use app to remove unnecessary files from your computer";
    homepage = "https://github.com/qarmin/czkawka";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ yanganto ];
  };
}
