{ inputs, ... }:
{
  flake.nixosModules = {
    variables = import ../../variables.nix;
  };
}
