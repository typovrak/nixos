{ config, pkgs, ... }:

let
	nixos-projects = fetchGit {
		url = "https://github.com/typovrak/nixos-projects.git";
		ref = "main";
		rev = "b2531655bb149b8e0979216e1e149e7ba0ab00db";
	};
	nixos-zsh = fetchGit {
		url = "https://github.com/typovrak/nixos-zsh.git";
		ref = "main";
		rev = "748293d9eae991fe98b0f416f6bb97d6bd6a30e5";
	};
	nixos-bash = fetchGit {
		url = "https://github.com/typovrak/nixos-bash.git";
		ref = "main";
		rev = "dc647fb656c7329b2c7bbff8b9379ddfaab272ce";
	};
	nixos-ssh = fetchGit {
		url = "https://github.com/typovrak/nixos-ssh.git";
		ref = "main";
		rev = "141d811fef9ee8b0dffce8a8bceecf6ab2d84e92";
	};
	nixos-git = fetchGit {
		url = "https://github.com/typovrak/nixos-git.git";
		ref = "main";
		rev = "60a95c95535610e4cbbc847acee6f5df7810cb03";
	};
	nixos-flatpak = fetchGit {
		url = "https://github.com/typovrak/nixos-flatpak.git";
		ref = "main";
		rev = "8bd077cb8ee744d5b20938ff0a2fa0318bd0a4fb";
	};
	nixos-fonts = fetchGit {
		url = "https://github.com/typovrak/nixos-fonts.git";
		ref = "main";
		rev = "72e1873ae4c618435691418bafb7c6fe587493bb";
	};
	nixos-gtk = fetchGit {
		url = "https://github.com/typovrak/nixos-gtk.git";
		ref = "main";
		rev = "373debf566a6c2f571cc5addbe61b4c5ba3e8e86";
	};
	nixos-alacritty = fetchGit {
		url = "https://github.com/typovrak/nixos-alacritty.git";
		ref = "main";
		rev = "07941de4afd240179af2cef195b4022b5c8cb257";
	};
	nixos-polybar = fetchGit {
		url = "https://github.com/typovrak/nixos-polybar.git";
		ref = "main";
		rev = "705383143f1b49bf21c8ce377a768a753ebc4aee";
	};
	nixos-nvim = fetchGit {
		url = "https://github.com/typovrak/nixos-nvim.git";
		ref = "main";
		rev = "0cfa745cff4f86e1b7fd83b67831f3b0709d4740";
	};
	nixos-pavucontrol = fetchGit {
		url = "https://github.com/typovrak/nixos-pavucontrol.git";
		ref = "main";
		rev = "b579960557cbb6a9820079e8d9ecfa3c2af03b9b";
	};
	nixos-neofetch = fetchGit {
		url = "https://github.com/typovrak/nixos-neofetch.git";
		ref = "main";
		rev = "9e8ab24e28be36eee77d76ecbed0c1450fd61a23";
	};
in {
	imports = [
		/etc/nixos/hardware-configuration.nix
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
	];

	system = {
		# TODO: add beautiful readme.md for every package
		# TODO: replace flathub apps by nix apps perhaps? and install vscode
		# TODO: séparer gh et git
		stateVersion = "24.11";
	};

	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
	};

	networking = {
		hostName = "typonixos";
		networkmanager.enable = true;
	};

	time.timeZone = "Europe/Paris";

	i18n = {
		defaultLocale = "en_US.UTF-8";
		extraLocaleSettings = {
			LC_ADDRESS = "fr_FR.UTF-8";
			LC_IDENTIFICATION = "fr_FR.UTF-8";
			LC_MEASUREMENT = "fr_FR.UTF-8";
			LC_MONETARY = "fr_FR.UTF-8";
			LC_NAME = "fr_FR.UTF-8";
			LC_NUMERIC = "fr_FR.UTF-8";
			LC_PAPER = "fr_FR.UTF-8";
			LC_TELEPHONE = "fr_FR.UTF-8";
			LC_TIME = "fr_FR.UTF-8";
		};
	};

	users.users.typovrak = {
		isNormalUser = true;
		description = "typovrak";
		extraGroups = [
			"networkmanager"
			"wheel"
			"audio"
		];
	};

	environment = {
		systemPackages = with pkgs; [
			tree man-db
			jq gcc ripgrep fd unzip fuse inxi iw playerctl
			chromium firefox
			docker docker-compose
			tmux
			gdu fzf bat htop btop
			rpi-imager filezilla gedit screenkey
			ghostty maim xclip copyq nautilus gnome-disk-utility
			neofetch dmenu feh sddm yazi cava
			wireplumber pamixer helvum
			gh # delete after
		];
		etc = {
			"nixos-config-wallpaper".source = pkgs.fetchFromGitHub {
				owner = "typovrak";
				repo = "nixos-config-wallpaper";
				rev = "main";
				sha256 = "sha256-63suKn9oC6fQDrjnSJlG9EW/EFHBh39nfUXWJbRoxgI=";
			};
		};
	};

	hardware.pulseaudio.enable = false;

	security.rtkit.enable = true;

	services = {
		xserver = {
			enable = true;
			desktopManager.xterm.enable = true;
			windowManager.i3.enable = true;
			xkb = {
				layout = "us";
				variant = "altgr-intl";
			};
		};
		displayManager = {
			defaultSession = "none+i3";
			sddm.enable = true;
		};
		pipewire = {
			enable = true;
			audio.enable = true;
			pulse.enable = true;
			alsa = {
				enable = true;
				support32Bit = true;
			};
			wireplumber.enable = true;
		};
		printing.enable = true;
	};
}
