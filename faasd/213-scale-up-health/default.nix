{ stdenv
, lib
, bash
, subversion
, makeWrapper
, k6-prometheus,
...
}:
  stdenv.mkDerivation {
    name = "faasd-213-test";
    # buildInputs = [ bash k6-prometheus ];
    nativeBuildInputs = [ makeWrapper ];
    src = ./.;
    installPhase = ''
      mkdir -p $out/bin
      cp test.sh $out/bin/test.sh
      cp script.js $out/bin/script.js
      wrapProgram $out/bin/test.sh \
        --prefix PATH : ${lib.makeBinPath [ bash k6-prometheus ]}
    '';
  }