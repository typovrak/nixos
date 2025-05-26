{ inputs, ... }:
{
  perSystem = { config, self', pkgs, lib, ... }: {
    devShells.default = pkgs.mkShell {
      name = "nixos-shell";
      inputsFrom = [
        config.treefmt.build.devShell
        config.pre-commit.devShell # See ./nix/modules/pre-commit.nix
      ];
      packages = with pkgs; [
        just
        nixd # Nix language server
        nil
        lolcat
        lazygit
        gitflow

        # gignsky-dotfiles programs
        inputs.gignsky-dotfiles.packages.${system}.quick-results
        inputs.gignsky-dotfiles.packages.${system}.upjust
        inputs.gignsky-dotfiles.packages.${system}.cargo-update
      ];
      shellHook = ''
        echo "welcome to the rust development environment for the nixos environment" | ${pkgs.cowsay}/bin/cowsay | ${pkgs.lolcat}/bin/lolcat 2> /dev/null;
      '';
    };
  };
}
