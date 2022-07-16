{ buildGoModule, ... }:
buildGoModule {
  pname = "k6-prometheus";
  version = "0.39.0";

  src = ./.;

  vendorSha256 = "sha256-Cj5zGctnUxMieDYUMpC7Ob73WyXbtY4VNeeCVUHX6rQ=";
}