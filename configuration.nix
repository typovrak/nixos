{ config, pkgs, lib, ... }:

let
	nixos-projects = fetchGit {
    		url = "https://github.com/typovrak/nixos-projects.git";
    		ref = "main";
    		rev = "23c9dcd9ffbbc805f336ae8bbdcaa94f4a1f5a00";
  	};
  	nixos-zsh = fetchGit {
    		url = "https://github.com/typovrak/nixos-zsh.git";
    		ref = "main";
    		rev = "074eb14b333d8aac057c182d2e0d7cb7818c507d";
  	};
  	nixos-bash = fetchGit {
    		url = "https://github.com/typovrak/nixos-bash.git";
    		ref = "main";
    		rev = "9f0bd593f9420b34881cf1fac6ca4d3630421795";
  	};
  	nixos-ssh = fetchGit {
    		url = "https://github.com/typovrak/nixos-ssh.git";
    		ref = "main";
    		rev = "21357c7e08a295cc55e88ad16085dc47a97efe32";
  	};
  	nixos-git = fetchGit {
    		url = "https://github.com/typovrak/nixos-git.git";
    		ref = "main";
    		rev = "116cc93e46179d071366fd445e10b5774cc0eff4";
  	};
  	nixos-flatpak = fetchGit {
    		url = "https://github.com/typovrak/nixos-flatpak.git";
    		ref = "main";
    		rev = "9984605d64d7b246609f162d570c6d690fe627fc";
  	};
  	nixos-fonts = fetchGit {
    		url = "https://github.com/typovrak/nixos-fonts.git";
    		ref = "main";
    		rev = "43513a4e417ee857232c4e0125832457a411d380";
  	};
  	nixos-gtk = fetchGit {
    		url = "https://github.com/typovrak/nixos-gtk.git";
    		ref = "main";
    		rev = "25e45018140e7b56a3b091a2c4fc371aca5a136b";
  	};
  	nixos-alacritty = fetchGit {
    		url = "https://github.com/typovrak/nixos-alacritty.git";
    		ref = "main";
    		rev = "530cbbbe0f7fb5b7f529b417ea01756867825024";
  	};
  	nixos-polybar = fetchGit {
    		url = "https://github.com/typovrak/nixos-polybar.git";
    		ref = "main";
    		rev = "1c2d4d039e52426cfe09f3a7b0cc4065afba8ef2";
  	};
  	nixos-nvim = fetchGit {
    		url = "https://github.com/typovrak/nixos-nvim.git";
    		ref = "main";
    		rev = "093899bfa3e00071da2b2e59b08f9d3a72002f82";
  	};
  	nixos-pavucontrol = fetchGit {
    		url = "https://github.com/typovrak/nixos-pavucontrol.git";
    		ref = "main";
    		rev = "10864bd78c46762cadf16764c2329142654fa643";
  	};
  	nixos-neofetch = fetchGit {
    		url = "https://github.com/typovrak/nixos-neofetch.git";
    		ref = "main";
    		rev = "20b6197d3df0e45375e03ae878220bdc98519771";
  	};
  	nixos-lazygit = fetchGit {
    		url = "https://github.com/typovrak/nixos-lazygit.git";
    		ref = "main";
    		rev = "84d5cba0a647c4bd2816620cd248f7a901c6116d";
  	};
  	nixos-gh = fetchGit {
    		url = "https://github.com/typovrak/nixos-gh.git";
    		ref = "main";
    		rev = "b606bc30b4730fa423bf36ea9b7c43312a720a8a";
  	};
  	nixos-i3lock-color = fetchGit {
    		url = "https://github.com/typovrak/nixos-i3lock-color.git";
    		ref = "main";
    		rev = "a36a98beba46998366c80c455b61df62733e6c67";
  	};
  	nixos-cava = fetchGit {
    		url = "https://github.com/typovrak/nixos-cava.git";
    		ref = "main";
    		rev = "18194dba5305267f9e1e6111bfe2f1daa48e5a3b";
  	};
  	nixos-screenkey = fetchGit {
    		url = "https://github.com/typovrak/nixos-screenkey.git";
    		ref = "main";
    		rev = "adc15b149bfa53afa71e05c58cff8dd7d547f705";
  	};
  	nixos-htop = fetchGit {
    		url = "https://github.com/typovrak/nixos-htop.git";
    		ref = "main";
    		rev = "05c6c80f67769c035ea60da1a1a4171f2c18f854";
  	};
  	nixos-btop = fetchGit {
    		url = "https://github.com/typovrak/nixos-btop.git";
    		ref = "main";
    		rev = "b1791e8752989ef3ad9801eac469e6700512c733";
  	};
  	nixos-launchers = fetchGit {
    		url = "https://github.com/typovrak/nixos-launchers.git";
    		ref = "main";
    		rev = "ed91e036f0e886ef97c2cc8b0cac4b3dad6d652e";
  	};
  	nixos-yazi = fetchGit {
    		url = "https://github.com/typovrak/nixos-yazi.git";
    		ref = "main";
    		rev = "4baba9b239c0edd8642a977cf6c0a66a5246e1b1";
  	};
  	nixos-ghostty = fetchGit {
    		url = "https://github.com/typovrak/nixos-ghostty.git";
    		ref = "main";
    		rev = "c65773f29add1a1b628daa88201cd48aad853902";
  	};
  	nixos-audio = fetchGit {
    		url = "https://github.com/typovrak/nixos-audio.git";
    		ref = "main";
    		rev = "d32f4c8a19a7957c91a9cd478e92d45c00c89e73";
  	};
  	nixos-fastfetch = fetchGit {
    		url = "https://github.com/typovrak/nixos-fastfetch.git";
    		ref = "main";
    		rev = "0ecefadefacbd5156375966bb21441f288072f7b";
  	};
  	nixos-locale = fetchGit {
    		url = "https://github.com/typovrak/nixos-locale.git";
    		ref = "main";
    		rev = "2eb03936d7daba2d62e78d353ce07bbdf5e8601b";
  	};
  	nixos-bat = fetchGit {
    		url = "https://github.com/typovrak/nixos-bat.git";
    		ref = "main";
    		rev = "ca2a5ff6c6fa6d1952ab498943545f362e907859";
  	};
  	nixos-lightdm = fetchGit {
    		url = "https://github.com/typovrak/nixos-lightdm.git";
    		ref = "main";
    		rev = "64ca367679e05f097bb29a249e47aec2e74e0826";
  	};
  	nixos-i3 = fetchGit {
    		url = "https://github.com/typovrak/nixos-i3.git";
    		ref = "main";
    		rev = "39f24e4f30e4f288ee8f9ca10774192e5f839c54";
  	};
  	nixos-stylus = fetchGit {
    		url = "https://github.com/typovrak/nixos-stylus.git";
    		ref = "main";
    		rev = "e760d17e56fefb3a9386673c48aabbb0cd9018d2";
	};
	nixos-nemo = fetchGit {
		url = "https://github.com/typovrak/nixos-nemo.git";
		ref = "main";
		rev = "4c5a2f449958144b18f0a8e6d22b5c793e23e9f5";
	};
	nixos-zellij = fetchGit {
		url = "https://github.com/typovrak/nixos-zellij.git";
		ref = "main";
		rev = "7b8d45de50c69ff9433bcb33c57419c6721844aa";
	};
in {
  	imports = [
			/etc/nixos/hardware-configuration.nix
			/etc/nixos/variables.nix
    		(import "${nixos-locale}/configuration.nix")
    		(import "${nixos-projects}/configuration.nix")
    		(import "${nixos-zsh}/configuration.nix")
    		(import "${nixos-bash}/configuration.nix")
    		(import "${nixos-ssh}/configuration.nix")
    		(import "${nixos-git}/configuration.nix")
    		(import "${nixos-flatpak}/configuration.nix")
    		(import "${nixos-fonts}/configuration.nix")
    		(import "${nixos-gtk}/configuration.nix")
    		(import "${nixos-alacritty}/configuration.nix")
    		(import "${nixos-polybar}/configuration.nix")
    		(import "${nixos-nvim}/configuration.nix")
    		(import "${nixos-pavucontrol}/configuration.nix")
    		(import "${nixos-neofetch}/configuration.nix")
    		(import "${nixos-lazygit}/configuration.nix")
    		(import "${nixos-gh}/configuration.nix")
    		(import "${nixos-i3lock-color}/configuration.nix")
    		(import "${nixos-cava}/configuration.nix")
    		(import "${nixos-screenkey}/configuration.nix")
    		(import "${nixos-htop}/configuration.nix")
    		(import "${nixos-btop}/configuration.nix")
    		(import "${nixos-launchers}/configuration.nix")
    		(import "${nixos-yazi}/configuration.nix")
    		(import "${nixos-ghostty}/configuration.nix")
    		(import "${nixos-audio}/configuration.nix")
    		(import "${nixos-fastfetch}/configuration.nix")
    		(import "${nixos-bat}/configuration.nix")
    		(import "${nixos-lightdm}/configuration.nix")
    		(import "${nixos-i3}/configuration.nix")
    		(import "${nixos-stylus}/configuration.nix")
			(import "${nixos-nemo}/configuration.nix")
			(import "${nixos-zellij}/configuration.nix")
  	];

	system = { stateVersion = "24.11"; };

 	boot.loader = {
    		systemd-boot.enable = true;
    		efi.canTouchEfiVariables = true;
  	};

	networking = {
		hostName = "typonixos";
		networkmanager.enable = true;
	};

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	nixpkgs.config.allowUnfree = true;

	users = {
		users.${config.username} = {
			isNormalUser = true;
    			extraGroups = [
				"networkmanager"
				"wheel"
				"audio"
				"docker"
			];
		};
  		groups.mlocate = {};
  	};

  	environment.systemPackages = with pkgs; [
      		tree
      		man-db
      		jq
      		gcc
      		ripgrep
      		fd
      		unzip
      		fuse
      		inxi
      		wget
      		docker
      		docker-compose
      		tmux
      		gdu
      		fzf
      		rpi-imager
      		filezilla
      		gedit
      		vscode
      		slack
      		discord
      		rnote
      		xclip
      		copyq
      		gnome-disk-utility
      		lolcat
      		ascii-image-converter
      		mlocate
      		pciutils
			nodePackages.live-server
			nodejs_23
			pnpm
			tealdeer
			gnumake
			gitleaks
			trivy
			dive
			calc
			zellij
			wdiff
			insomnia
	];

 	services.printing.enable = true;

	virtualisation.docker.enable = true;
}
