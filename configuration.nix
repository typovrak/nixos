{ config, pkgs, lib, ... }:

let
  	nixos-projects = fetchGit {
    	url = "https://github.com/typovrak/nixos-projects.git";
    	ref = "main";
    	rev = "6ca4a3e430f10bfcebf5d7b8805db83cfa8986fe";
  	};
  	nixos-zsh = fetchGit {
    	url = "https://github.com/typovrak/nixos-zsh.git";
    	ref = "main";
    	rev = "55181d862b8459851d8ec6b97fd48f2a8298bd4d";
  	};
  	nixos-bash = fetchGit {
    	url = "https://github.com/typovrak/nixos-bash.git";
    	ref = "main";
    	rev = "8556f10b3ac702412e62b0be69553d04105de01f";
  	};
  	nixos-ssh = fetchGit {
    	url = "https://github.com/typovrak/nixos-ssh.git";
    	ref = "main";
    	rev = "d6e3dd9221f7808180924a9cd3dfa5c663bbec4b";
  	};
  	nixos-git = fetchGit {
    	url = "https://github.com/typovrak/nixos-git.git";
    	ref = "main";
    	rev = "5909c9068bd02261a2379121b85b10c6400e1238";
  	};
  	nixos-flatpak = fetchGit {
    	url = "https://github.com/typovrak/nixos-flatpak.git";
    	ref = "main";
    	rev = "05cb398922050615b223a96419bbba31b9ab386a";
  	};
  	nixos-fonts = fetchGit {
    	url = "https://github.com/typovrak/nixos-fonts.git";
    	ref = "main";
    	rev = "e6b92fa59d87783c2bfc9d2ccd4acb3c025cda6a";
  	};
  	nixos-gtk = fetchGit {
    	url = "https://github.com/typovrak/nixos-gtk.git";
    	ref = "main";
    	rev = "610c7f6912961adadd9471d19db8eeb6f7a27f50";
  	};
  	nixos-alacritty = fetchGit {
    	url = "https://github.com/typovrak/nixos-alacritty.git";
    	ref = "main";
    	rev = "79ee964748b62724b05e614c9bf379786d2392e7";
  	};
  	nixos-polybar = fetchGit {
    	url = "https://github.com/typovrak/nixos-polybar.git";
    	ref = "main";
    	rev = "44e2aedb84c5f724d18b99625f6eb7f2daa17788";
  	};
  	nixos-nvim = fetchGit {
    	url = "https://github.com/typovrak/nixos-nvim.git";
    	ref = "main";
    	rev = "eea0e1d5fb671859b6729c2c788fad3d68de4eea";
  	};
  	nixos-pavucontrol = fetchGit {
    	url = "https://github.com/typovrak/nixos-pavucontrol.git";
    	ref = "main";
    	rev = "b4a9c5893dc9b25a133c3170182ef92a89defb82";
  	};
  	nixos-neofetch = fetchGit {
    	url = "https://github.com/typovrak/nixos-neofetch.git";
    	ref = "main";
    	rev = "ccbdda07415143d1b2a602f17d573b7afc217890";
  	};
  	nixos-lazygit = fetchGit {
    	url = "https://github.com/typovrak/nixos-lazygit.git";
    	ref = "main";
    	rev = "b863a0a498b981b99bfb41c674de44ec027c4ea5";
  	};
  	nixos-gh = fetchGit {
    	url = "https://github.com/typovrak/nixos-gh.git";
    	ref = "main";
    	rev = "f94f413f175db047e5c16c71f9d44f13db7423f1";
  	};
  	nixos-i3lock-color = fetchGit {
    	url = "https://github.com/typovrak/nixos-i3lock-color.git";
    	ref = "main";
    	rev = "acb27d6837a2c375e99f0eaf5460374fe36de851";
  	};
  	nixos-cava = fetchGit {
    	url = "https://github.com/typovrak/nixos-cava.git";
    	ref = "main";
    	rev = "7c18a855ed1f52dfa39771e1ffb78d99d1851e47";
  	};
  	nixos-screenkey = fetchGit {
    	url = "https://github.com/typovrak/nixos-screenkey.git";
    	ref = "main";
    	rev = "52f404419c0df52dd3bcfdd302f5a85f10878f46";
  	};
  	nixos-htop = fetchGit {
    	url = "https://github.com/typovrak/nixos-htop.git";
    	ref = "main";
    	rev = "8ccceef40689f4ad4e994c0a1747bb82df62bbe2";
  	};
  	nixos-btop = fetchGit {
    	url = "https://github.com/typovrak/nixos-btop.git";
    	ref = "main";
    	rev = "4ca0d01ee97a74359ddf821718f7d8f400c1bb81";
  	};
  	nixos-launchers = fetchGit {
    	url = "https://github.com/typovrak/nixos-launchers.git";
    	ref = "main";
    	rev = "9a703b4d45d6189ded02e6b0d8ae84f92523869e";
  	};
  	nixos-yazi = fetchGit {
    	url = "https://github.com/typovrak/nixos-yazi.git";
    	ref = "main";
    	rev = "6d5c026706aa35d57c1ba50abc83ee05525ab816";
  	};
  	nixos-ghostty = fetchGit {
    	url = "https://github.com/typovrak/nixos-ghostty.git";
    	ref = "main";
    	rev = "843b4debfbe3c0d4b0cb76a4a000a3d2f6fe6836";
  	};
  	nixos-audio = fetchGit {
    	url = "https://github.com/typovrak/nixos-audio.git";
    	ref = "main";
    	rev = "689a7ccd5c25455f61d02636daab938bb68e4aa2";
  	};
  	nixos-fastfetch = fetchGit {
    	url = "https://github.com/typovrak/nixos-fastfetch.git";
    	ref = "main";
    	rev = "0de88e5016970681a82ce2b07966a2fac9a36d33";
  	};
  	nixos-locale = fetchGit {
    	url = "https://github.com/typovrak/nixos-locale.git";
    	ref = "main";
    	rev = "d148a8f975f2a9aa5544c40525d860498e9e5af4";
  	};
  	nixos-bat = fetchGit {
    	url = "https://github.com/typovrak/nixos-bat.git";
    	ref = "main";
    	rev = "4f4a89ee94b19f3869c5a7b6c2f49104d3ffdf73";
  	};
  	nixos-lightdm = fetchGit {
    	url = "https://github.com/typovrak/nixos-lightdm.git";
    	ref = "main";
    	rev = "6bcb0df8ac13c7ce259f9352034d0eab3aee5d6f";
  	};
  	nixos-i3 = fetchGit {
    	url = "https://github.com/typovrak/nixos-i3.git";
    	ref = "main";
    	rev = "88f0ee949ac7bc702b49b877d29db5fa018a8c2a";
  	};
  	nixos-stylus = fetchGit {
    	url = "https://github.com/typovrak/nixos-stylus.git";
    	ref = "main";
    	rev = "76462ddf0919bdfd040a3c0b06ed081879d5176b";
	};
	nixos-nemo = fetchGit {
		url = "https://github.com/typovrak/nixos-nemo.git";
		ref = "main";
		rev = "924b68b04123a0716bcd16eaa6c329e13ec148f5";
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
			];
		};
  		groups.mlocate = {};
  	};

  	environment = {
    	systemPackages = with pkgs; [
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
 		];
 	};

 	services.printing.enable = true;
}
