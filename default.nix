let
  haskell = import ../haskell.nix/default.nix {};

  pkgSet = haskell.mkStackPkgSet {
    stack-pkgs = {
      resolver = "nightly-2019-07-19";
      extras = hackage: {
        packages."stack" = hackage."stack"."2.1.3.1".revisions.default;
      };
    };
  };
in

{
  inherit (pkgSet.config) hsPkgs;
}
