{ config, pkgs, ... }:

let
	nixos-projects = fetchGit {
		url = "https://github.com/typovrak/nixos-projects.git";
		ref = "main";
		rev = "c31ed9a089e92d4af2338e014ea65ce0668fa909";
	};
	nixos-zsh = fetchGit {
		url = "https://github.com/typovrak/nixos-zsh.git";
		ref = "main";
		rev = "742fb93491c5dc791978902274bafc941e0e9755";
	};
	nixos-bash = fetchGit {
		url = "https://github.com/typovrak/nixos-bash.git";
		ref = "main";
		rev = "f7817282a2a03301d9601b8cddc3c31994f457a9";
	};
	nixos-ssh = fetchGit {
		url = "https://github.com/typovrak/nixos-ssh.git";
		ref = "main";
		rev = "141d811fef9ee8b0dffce8a8bceecf6ab2d84e92";
	};
	nixos-git = fetchGit {
		url = "https://github.com/typovrak/nixos-git.git";
		ref = "main";
		rev = "827ceec13bbd0a5c4ca3fbf494e9f2db31df8c48";
	};
	nixos-flatpak = fetchGit {
		url = "https://github.com/typovrak/nixos-flatpak.git";
		ref = "main";
		rev = "fc3cca6c395661609b408794e251e26fdb61382a";
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
	];

	system = {
		# TODO: add stateVersion on every package
		# TODO: add beautiful readme.md for every package
		# TODO: replace flathub apps by nix apps perhaps? and install vscode
		stateVersion = "24.11";
		activationScripts = {
			dotConfig = ''
				ln -sFf /home/typovrak/nixos-config/.config /home/typovrak/.config
			'';
			gtk = ''
				mkdir -p /home/typovrak/.config/gtk-3.0
				cat > /home/typovrak/.config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-theme-name=Adwaita-dark
gtk-application-prefer-dark-theme=1
EOF
				chown typovrak:users /home/typovrak/.config/gtk-3.0/settings.ini
				chmod 644 /home/typovrak/.config/gtk-3.0/settings.ini
			'';
		};
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
			vim neovim tmux
			gdu fzf bat htop btop gh
			rpi-imager filezilla gedit screenkey
			alacritty ghostty maim xclip copyq pavucontrol nautilus gnome-disk-utility brightnessctl
			neofetch dmenu polybar feh lxappearance sddm gnome-themes-extra yazi cava
			wireplumber pamixer helvum
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

	fonts = {
		enableDefaultPackages = true;
		fontconfig.enable = true;
		packages = with pkgs; [
			noto-fonts-emoji
			(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
		];
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

	programs = {
		dconf.enable = true;
	};
}
