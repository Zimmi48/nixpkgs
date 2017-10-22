{ stdenv, fetchFromGitHub, coq }:

with (
  if coq.coq-version == "8.6" then {
    rev = "v8.6.1";
    sha256 = "0553pcsy21cyhmns6k9qggzb67az8kl31d0lwlnz08bsqswigzrj";
  }
  else if coq.coq-version == "8.7" then {
    rev = "V8.7.0";
    sha256 = "0rx2vaz8v9qhwnss3gr85qpdaqhi7vii7ag28k0n1bd3bffxa37b";
  }
  else if coq.coq-version == "8.8" then {
    rev = "6c4b9b4dd8939efb36e53cbadf0866b534d1fec3";
    sha256 = "1d8ppcb9kiv530wmw8z3qq4vsdnbxrzna6dmjds283dyszbgr6pj";
  }
  else
    throw "bignums is not available for Coq ${coq.coq-version}"
);

stdenv.mkDerivation rec {

  name = "coq${coq.coq-version}-bignums";

  src = fetchFromGitHub {
    owner = "ppedrot";
    repo = "bignums";
    inherit rev sha256;
  };

  buildInputs = [ coq.ocaml coq.camlp5 ];
  propagatedBuildInputs = [ coq ];

  installFlags = "COQLIB=$(out)/lib/coq/${coq.coq-version}/";

  meta = with stdenv.lib; {
    license = licenses.lgpl2;
    platforms = coq.meta.platforms;
  };

}
