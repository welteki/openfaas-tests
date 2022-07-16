{
  description = "OpenFaaS examples and tests";

  outputs = { self, nixpkgs }: {
    overlay = final: prev: {
      k6-prometheus = import ./faasd/213-scale-up-health/k6 final;
    };

    packages.x86_64-linux =
      let 
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          overlays = [ self.overlay ];
        };
      in {
        inherit (pkgs) k6-prometheus;
        faasd-213-test = import ./faasd/213-scale-up-health pkgs;
      };

    apps.x86_64-linux.faasd-213-test = {
      type = "app";
      program = "${self.packages.x86_64-linux.faasd-213-test}/bin/test.sh";
    };
  };
}
