{ inputs, ... }:
{
  flake.nixosModules = {
    variables = import ../../variables.nix;
    default = {
      imports = [
        ../../configuration.nix
      ];
    };
  };
}
