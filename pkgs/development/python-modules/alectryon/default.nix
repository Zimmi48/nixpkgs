{ lib, buildPythonPackage, fetchPypi, pygments, dominate, beautifulsoup4, docutils, sphinx, coqPackages }:

buildPythonPackage rec {
  pname = "alectryon";
  version = "1.2.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1imcqp891ayqxzss72hl7s1vpk8f8nzqlhz4zbvwk5jlc57r51pf";
  };

  propagatedBuildInputs = [
    pygments
    dominate
    beautifulsoup4
    docutils
    sphinx
    coqPackages.serapi
  ];

  doCheck = true;

  meta = with lib; {
    homepage = "https://github.com/cpitclaudel/alectryon";
    description = "";
    license = licenses.mit;
    maintainers = with maintainers; [ Zimmi48 ];
  };
}
