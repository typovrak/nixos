{ config, pkgs, lib, ... }:

let
	nixos-projects = fetchGit {
		url = "https://github.com/typovrak/nixos-projects.git";
		ref = "main";
		rev = "b2531655bb149b8e0979216e1e149e7ba0ab00db";
	};
	nixos-zsh = fetchGit {
		url = "https://github.com/typovrak/nixos-zsh.git";
		ref = "main";
		rev = "32a869dccbb131cab8e400447b86ad4eb066567e";
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
		rev = "914785e50ebb105527e98708c98a658d2c8de8ea";
	};
	nixos-fonts = fetchGit {
		url = "https://github.com/typovrak/nixos-fonts.git";
		ref = "main";
		rev = "72e1873ae4c618435691418bafb7c6fe587493bb";
	};
	nixos-gtk = fetchGit {
		url = "https://github.com/typovrak/nixos-gtk.git";
		ref = "main";
		rev = "18f360310152d946f9c9d64f80631443f16e501b";
	};
	nixos-alacritty = fetchGit {
		url = "https://github.com/typovrak/nixos-alacritty.git";
		ref = "main";
		rev = "07941de4afd240179af2cef195b4022b5c8cb257";
	};
	nixos-polybar = fetchGit {
		url = "https://github.com/typovrak/nixos-polybar.git";
		ref = "main";
		rev = "189459e52981ee64d7df46476cc5e5fd00b9a68b";
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
		rev = "a7344ff3453d6b79275e8c4dafb1da4882e1bee2";
	};
	nixos-yazi = fetchGit {
		url = "https://github.com/typovrak/nixos-yazi.git";
		ref = "main";
		rev = "1e6c592c946b03564c839a2b3d3753b662c9e3c9";
	};
	nixos-ghostty = fetchGit {
		url = "https://github.com/typovrak/nixos-ghostty.git";
		ref = "main";
		rev = "cdd77619302d912107d7ab7143b0f2ffc1c3a22f";
	};
	nixos-audio = fetchGit {
		url = "https://github.com/typovrak/nixos-audio.git";
		ref = "main";
		rev = "f7e8f698d349199b9dd5e178b913ed976eda7a24";
	};
	nixos-fastfetch = fetchGit {
		url = "https://github.com/typovrak/nixos-fastfetch.git";
		ref = "main";
		rev = "b13cf6af53fd9df69d46ef9f55997e0888ba6fd0";
	};
	nixos-locale = fetchGit {
		url = "https://github.com/typovrak/nixos-locale.git";
		ref = "main";
		rev = "40196e5c6b7f24446d057d8ba64d2482ac17be92";
	};
	nixos-bat = fetchGit {
		url = "https://github.com/typovrak/nixos-bat.git";
		ref = "main";
		rev = "ad185d8009a2b6eb3c217277422adecd04aa740b";
	};
	nixos-lightdm = fetchGit {
		url = "https://github.com/typovrak/nixos-lightdm.git";
		ref = "main";
		rev = "a63bd73b594575af7b23489b7372e2a077060e66";
	};
	nixos-i3 = fetchGit {
		url = "https://github.com/typovrak/nixos-i3.git";
		ref = "main";
		rev = "057076b9ce9f4cfb4ec7bdd1e254bcd62a0fdd6e";
	};
in {
	imports = [
		/etc/nixos/hardware-configuration.nix
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

	nix.settings.experimental-features = [
		"nix-command"
		"flakes"
	];

	nixpkgs.config.allowUnfree = true;

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
			tree
			man-db
			jq
			gcc
			ripgrep
			fd
			unzip 
			fuse
			inxi
			chromium
			firefox
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
			nautilus
			gnome-disk-utility
			lolcat
			ascii-image-converter
		];
	};

	services.printing.enable = true;
}
