{ config, pkgs, ... }:

let
	nixos-projects = fetchGit {
		url = "https://github.com/typovrak/nixos-projects.git";
		ref = "main";
	};
in {
	imports = [
		./hardware-configuration.nix
		(import "${nixos-projects}/configuration.nix")
	];

	system = {
		stateVersion = "24.11";
		activationScripts = {
			dotConfig = ''
				ln -sFf /home/typovrak/nixos-config/.config /home/typovrak/.config
			'';
			bash = ''
				export PATH=${pkgs.coreutils}/bin:$PATH
				rm -f /bin/bash
				mkdir -p /bin
				ln -sF /etc/bin/bash /bin/bash
			'';
			flatpak = ''
				export PATH=${pkgs.flatpak}/bin:${pkgs.coreutils}/bin:${pkgs.util-linux}/bin:$PATH
				flatpak install -y flathub md.obsidian.Obsidian
				flatpak install -y flathub com.slack.Slack
				flatpak install -y flathub org.videolan.VLC
				flatpak install -y flathub com.obsproject.Studio
				flatpak install -y flathub org.gimp.GIMP
				flatpak install -y flathub com.vscodium.codium
				flatpak install -y flathub org.shotcut.Shotcut
			'';
			ssh = ''
				mkdir -p /home/typovrak/.ssh
				chown typovrak:users /home/typovrak/.ssh
				chmod 700 /home/typovrak/.ssh
			'';
			gitconfig = ''
				cat > /home/typovrak/.gitconfig <<EOF
[user]
	name = typovrak
	email = typovrak@gmail.com
[init]
	defaultBranch = main
[pull]
	rebase = true
[push]
	autoSetupRemote = true
EOF
				chown typovrak:users /home/typovrak/.gitconfig
				chmod 644 /home/typovrak/.gitconfig
			'';
			zsh = ''
				touch /home/typovrak/.zshrc
				chown typovrak:users /home/typovrak/.zshrc
				chmod 644 /home/typovrak/.zshrc

				touch /home/typovrak/.zsh_history
				chown typovrak:users /home/typovrak/.zsh_history
				chmod 644 /home/typovrak/.zsh_history
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
		shell = pkgs.zsh;
		extraGroups = [
			"networkmanager"
			"wheel"
			"audio"
		];
	};

	environment = {
		systemPackages = with pkgs; [
			git tree man-db openssh
			jq gcc ripgrep fd unzip fuse inxi iw playerctl
			chromium firefox
			flatpak
			docker docker-compose
			zsh vim neovim tmux zsh-autosuggestions zsh-syntax-highlighting starship
			lazygit gdu fzf bat htop btop gh
			rpi-imager filezilla gedit screenkey
			alacritty ghostty maim xclip copyq pavucontrol nautilus gnome-disk-utility brightnessctl
			neofetch fastfetch dmenu polybar feh lxappearance sddm gnome-themes-extra yazi cava
			wireplumber pamixer helvum
		];
		etc = {
			"bin/bash".source = "${pkgs.bash}/bin/bash";
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

	systemd.services.flatpak-repo = {
    		wantedBy = [ "multi-user.target" ];
    		path = [ pkgs.flatpak ];
    		script = ''
      			flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    		'';
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
		openssh.enable = true;
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
		flatpak.enable = true;
	};

	programs = {
		zsh = {
			enable = true;
			enableCompletion = true;
			promptInit = ''
				autoload -Uz compinit
				compinit

				source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
				source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
				eval "$(${pkgs.starship}/bin/starship init zsh)"

				if [ -z "$SSH_AUTH_SOCK" ]; then
					eval "$(${pkgs.openssh}/bin/ssh-agent -s)" &>/dev/null
				fi

				${pkgs.openssh}/bin/ssh-add ~/.ssh/mscholz-dev_gitlab &>/dev/null
				${pkgs.openssh}/bin/ssh-add ~/.ssh/typovrak_github &>/dev/null

				fastfetch
			'';
		};
		dconf.enable = true;
	};

	xdg.portal = {
		enable = true;
		config.common.default = "gtk";
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	};
}
