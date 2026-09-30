[![NixOS 26.05+](https://img.shields.io/badge/NixOS-26.05%2B-a6e3a1?labelColor=45475a)](https://nixos.org/)
[![License MIT](https://img.shields.io/badge/License-MIT-cba6f7.svg?labelColor=45475a)](LICENSE.md)
[![Portal](https://img.shields.io/badge/Portal-typovrak.tv%2Fnixos-eba0ac?labelColor=45475a)](https://typovrak.tv/nixos)
[![Discord join us](https://img.shields.io/badge/Discord-Join%20us-74c7ec?labelColor=45475a&logo=discord&logoColor=white)](https://typovrak.tv/discord)

<div>
  <a href="https://visitorbadge.io/status?path=https%3A%2F%2Fgithub.com%2Ftypovrak%2Fnixos"><img src="https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Ftypovrak%2Fnixos&label=GET%20https%3A%2F%2Fgithub.com%2Ftypovrak%2Fnixos&labelColor=%23a6e3a1&countColor=%231e1e2e" /></a>
</div>

# 💜 NixOS

> Modular NixOS setup: shell, GUI, development tools, window manager, audio, fonts and theming.

## 🧩 Core of the Typovrak NixOS ecosystem

This repository is the entry point of ```Typovrak NixOS```, a modular and declarative NixOS configuration:

- 🧱 **30+ standalone modules:** one per tool or feature, like ```zsh```, ```i3```, ```lightdm```, ```polybar``` or ```gtk```.
- 🎨 **Catppuccin Mocha:** the default theme for the terminal, GUI apps and login screen.
- 🛡️ **Mostly FOSS:** ```allowUnfree``` is enabled for the NVIDIA driver and a few desktop apps (e.g. VS Code, Slack, Discord, DaVinci Resolve).
- 🧑‍💻 **Built for developers:** keyboard-driven i3 desktop and CLI tools like zsh, Neovim, LazyGit and yazi.

> [!CAUTION]
> This configuration is opinionated: it may override, replace or remove files and settings **without prompting**. Back up your existing files first (see [Backup](#3-backup)) or fork this repository to keep full control.

## 📦 Features

- 🚀 **Modular configuration:** each component (shell, editor, WM, audio, etc.) lives in its own reusable Nix module.
- 🔒 **Secure configs:** automatically creates and locks down ```~/.config/*``` with correct ownership and permissions.
- 🐚 **Shells:** zsh (with autosuggestions and syntax highlighting) and bash, set up out of the box.
- 🐙 **Git tooling:** Git, GitHub CLI & LazyGit with your ```.gitconfig``` deployed and ready.
- 🎨 **Theming:** Catppuccin Mocha green applied to GTK2/3/4, Alacritty, i3, Polybar & cursors.
- 🖥️ **Window manager:** i3wm + Polybar + LightDM GTK greeter with custom wallpaper.
- 🔤 **Fonts & emoji:** JetBrainsMono Nerd Font + Noto Emoji for complete glyph coverage.
- 🎬 **Multimedia:** PipeWire audio stack, pavucontrol, CAVA visualizer & screenkey.
- 📊 **Monitoring:** htop, btop & Fastfetch with tuned defaults.
- 💻 **Dev stack:** Node.js, TypeScript, Go, Rust, Python, Ruby, Docker, plus CLI tools like ```ripgrep```, ```fd```, ```fzf``` and ```jq```.
- 📂 **Project workspace:** automatically creates the ```~/projects``` directory.
- 🌐 **Flatpak support:** Flathub enabled and OBS Studio auto-installed.
- 🌍 **Localization:** Europe/Paris timezone with en_US default and French regional formats.

## 📂 Repository structure

```bash
❯ tree -a -I ".git*"
.
├── configuration.nix # main configuration, imports the modules
├── LICENSE.md        # MIT license
├── README.md         # this documentation
└── variables.nix     # defines your username

1 directory, 4 files
```

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 26.05 or newer.

### 2. User validation
The target user must be defined in ```config.username```.

Set it to your own login in ```variables.nix```. The default is `"typovrak"`, so if you leave it, a ```typovrak``` user will be created.

### 3. Backup
Back up your existing configuration before going further:
```bash
sudo cp /etc/nixos/configuration.nix{,.bak}
cp -r ~/nixos{,.bak}
cp -r ~/.config{,.bak}
cp -r ~/.local/share/applications{,.bak}
```
Add any other files you want to keep.

## ⬇️ Installation

### 🚀 Method 1: Out of the box

#### 1. Clone this repository
```bash
git clone https://github.com/typovrak/nixos.git ~/nixos
```

#### 2. Set your username in ```~/nixos/variables.nix```
```bash
# ~/nixos/variables.nix

{ lib, ... }:

{
  options.username = lib.mkOption {
    type = lib.types.str;
    default = "<YOUR_USER_USERNAME>";
  };
}
```

#### 3. Link into ```/etc/nixos```
```bash
sudo ln -sf ~/nixos/configuration.nix /etc/nixos/configuration.nix  
sudo ln -sf ~/nixos/variables.nix     /etc/nixos/variables.nix
```

#### 4. Rebuild and switch
```bash
sudo nixos-rebuild switch
```

### 🍴 Method 2: Fork

Fork the repo if you want to make it your own from the start, then clone your fork instead.

#### 1. Fork this repository

Click the Fork button on GitHub to copy this configuration to your account.

#### 2. Clone your fork

```bash
git clone https://github.com/<YOUR_USERNAME>/nixos.git ~/nixos
```

#### 3. Set your username in ```~/nixos/variables.nix```
```bash
# ~/nixos/variables.nix

{ lib, ... }:

{
  options.username = lib.mkOption {
    type = lib.types.str;
    default = "<YOUR_USER_USERNAME>";
  };
}
```

#### 4. Link into ```/etc/nixos```
```bash
sudo ln -sf ~/nixos/configuration.nix /etc/nixos/configuration.nix  
sudo ln -sf ~/nixos/variables.nix     /etc/nixos/variables.nix
```

#### 5. Rebuild and switch
```bash
sudo nixos-rebuild switch
```

## 🔧 Customization

- Enable or disable a module by adding or removing its ```(import "${<MODULE_NAME>}/configuration.nix")``` line in ```configuration.nix```.
- Update a module by setting the ```rev``` of its ```fetchGit``` entry to the hash from ```git log -1```.
- Adjust ```systemPackages``` or service options directly in the top-level configuration.
- Do whatever you want!

## 📚 Learn more

- 🧱 [NixOS official documentation](https://nixos.org/manual/nixos/stable/): complete guide to system configuration and module options.
- ⚙️ [Nixpkgs manual](https://nixos.org/manual/nixpkgs/stable/): reference for ```packages```, ```overlays```, ```fetchGit``` and module system internals.
- 📦 [Search Nix packages](https://search.nixos.org/packages): find and inspect packages available in the Nix ecosystem.
- 🖼️ [Catppuccin themes](https://github.com/catppuccin): official Catppuccin color schemes for terminals, apps and desktops.
- 🧠 [Zero to Nix](https://zero-to-nix.com/): a beginner-friendly guide to Nix and flakes.

## 🌐 My NixOS portal

[typovrak.tv/nixos](https://typovrak.tv/nixos) is a Catppuccin Mocha green portal to my GitHub and NixOS setup.

It lists every module, example and config in an interactive interface that looks like the desktop this configuration sets up.

## ❤️ Support

If this configuration saved you time, please ⭐️ the repo and share feedback.

## 💬 Join the Typovrak community on Discord 🇫🇷

For everyone who has ```rm -rf```ed their config by mistake or rebuilt for the 42nd time because a semicolon was missing.

🎯 [Join us on Discord »](https://typovrak.tv/discord)

🧭 Channels:

- ```💻 #nixos-setup``` - get help with modules and rebuilds.
- ```🌐 #web-dev``` - talk JS, TypeScript, React and Node.
- ```🧠 #open-source``` - share your repos and discuss FOSS culture.
- ```⌨️ #typing``` - layouts, mechanical keyboards and speed goals.
- ```🎨 #ricing``` - dotfiles, theming tips and desktop screenshots.

*Everyone's welcome no matter how many times you've broken your system ~~(except for Windows users)~~ 😄*

---

<p align="center"><i>Made with 💜 by <a href="https://typovrak.tv">typovrak</a></i></p>
