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
		rev = "37e1626c0d8c2531105866a345b156be8f22004b";
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
		rev = "23a089f07068d75f687a89a8ff28c8a8e063e69e";
	};
	nixos-fonts = fetchGit {
		url = "https://github.com/typovrak/nixos-fonts.git";
		ref = "main";
		rev = "72e1873ae4c618435691418bafb7c6fe587493bb";
	};
	nixos-gtk = fetchGit {
		url = "https://github.com/typovrak/nixos-gtk.git";
		ref = "main";
		rev = "edf38a5062c410af44bbd8a68de2f8cb87cd3017";
	};
	nixos-alacritty = fetchGit {
		url = "https://github.com/typovrak/nixos-alacritty.git";
		ref = "main";
		rev = "07941de4afd240179af2cef195b4022b5c8cb257";
	};
	nixos-polybar = fetchGit {
		url = "https://github.com/typovrak/nixos-polybar.git";
		ref = "main";
		rev = "b81cf44e7ff819667872fa0db977f396d4da8916";
	};
	nixos-nvim = fetchGit {
		url = "https://github.com/typovrak/nixos-nvim.git";
		ref = "main";
		rev = "4942481ac5f275a143f8ddb4dac208f4519d7a81";
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
	nixos-lazygit = fetchGit {
		url = "https://github.com/typovrak/nixos-lazygit.git";
		ref = "main";
		rev = "d148e4e348af575d7a620bf21364de0726c5c1c2";
	};
	nixos-gh = fetchGit {
		url = "https://github.com/typovrak/nixos-gh.git";
		ref = "main";
		rev = "99a68f7e648c37a16bbe752e60b41e73cd9c5eec";
	};
	nixos-i3lock-color = fetchGit {
		url = "https://github.com/typovrak/nixos-i3lock-color.git";
		ref = "main";
		rev = "65d60e79dd99c08851114bf22648662afac2b983";
	};
	nixos-cava = fetchGit {
		url = "https://github.com/typovrak/nixos-cava.git";
		ref = "main";
		rev = "f1833ef0ed0de3f533ba1096b996f3dae37e32b1";
	};
	nixos-screenkey = fetchGit {
		url = "https://github.com/typovrak/nixos-screenkey.git";
		ref = "main";
		rev = "3127aeba5890c60cae8a6d3cb0c053d5aae9d611";
	};
	nixos-htop = fetchGit {
		url = "https://github.com/typovrak/nixos-htop.git";
		ref = "main";
		rev = "cbaa9131dbaf4e244c0df7b7092b00e110babbe5";
	};
	nixos-btop = fetchGit {
		url = "https://github.com/typovrak/nixos-btop.git";
		ref = "main";
		rev = "bcd82eb56ccb1c9035d18cee86820a2875185c88";
	};
	nixos-launchers = fetchGit {
		url = "https://github.com/typovrak/nixos-launchers.git";
		ref = "main";
		rev = "9f9a82987b3cb60d347d7b59b833b61683e6a909";
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
		(import "${nixos-lazygit}/configuration.nix")
		(import "${nixos-gh}/configuration.nix")
		(import "${nixos-i3lock-color}/configuration.nix")
		(import "${nixos-cava}/configuration.nix")
		(import "${nixos-screenkey}/configuration.nix")
		(import "${nixos-htop}/configuration.nix")
		(import "${nixos-btop}/configuration.nix")
		(import "${nixos-launchers}/configuration.nix")
	];

	system = {
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

	nix.settings.experimental-features = [
		"nix-command"
	];

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
			gdu fzf bat
			rpi-imager filezilla gedit
			ghostty maim xclip copyq nautilus gnome-disk-utility
			dmenu feh sddm yazi
			wireplumber pamixer helvum
			rnote
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
