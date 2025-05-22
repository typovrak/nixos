[![NixOS 24.11+](https://img.shields.io/badge/NixOS-24.11%2B-a6e3a1?labelColor=45475a)](https://nixos.org/)
[![License MIT](https://img.shields.io/badge/License-MIT-cba6f7.svg?labelColor=45475a)](LICENSE.md)
[![Buy me a coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-☕-fab387?labelColor=45475a)](https://typovrak.tv/coffee)
[![Portal](https://img.shields.io/badge/Portal-typovrak.tv%2Fnixos-eba0ac?labelColor=45475a)](https://typovrak.tv/nixos)
[![Discord join us](https://img.shields.io/badge/Discord-Join%20us-74c7ec?labelColor=45475a&logo=discord&logoColor=white)](https://typovrak.tv/discord)

# 💜 Nixos

> Complete, modular NixOS setup covering shell, GUI, development tools, window manager, audio, fonts, theming and more.

## 🧩 Core of the Typovrak NixOS ecosystem

This repository is the main configuration of ```Typovrak NixOS```, a fully modular and declarative operating system configuration built entirely with :

- 🧱 **30+ standalone modules :** Each managing a specific tool, feature or aesthetic like ```zsh```, ```i3```, ```lighdm```, ```polybar```, ```gtk``` and more.
- 🎨 **Catppuccin Mocha :** The default theme across terminal, GUI, and login interfaces.
- 🛡️ **100% FOSS compliant :** No proprietary software included unless explicitly chosen.
- 🧑‍💻 **Built for developers :** Optimized for speed, keyboard-centric workflows and expressive CLI tooling.

*Explore the full system : 👉 **Right here***

> [!CAUTION]
> This module is opinionated, it may **override**, **replace**, or **remove** files and settings **without** prompt. To avoid unexpected changes, **back up** your existing files or **fork** this module to take full control. **Follow this documentation** to avoid any of this problem.

## 📦 Features

- 🚀 **Modular configuration :** Each component (shell, editor, WM, audio and more) lives in its own reusable Nix module.
- 🔒 **Secure configs :** automatically creates and locks down ```~/.config/*``` with correct ownership and permissions.
- 🐚 **Shells :** zsh, with autosuggestions and syntax-highlighting, and bash set up out-of-the-box.
- 🐙 **Git tooling :** Git, GitHub CLI & LazyGit with your ```.gitconfig``` deployed and ready.
- 🎨 **Theming :** Catppuccin mocha green applied to GTK2/3/4, Alacritty, i3, Polybar & cursors.
- 🖥️ **Window manager :** i3wm + Polybar + LightDM GTK greeter with custom wallpaper.
- 🔤 **Fonts & emoji :** JetBrainsMono Nerd Font + Noto Emoji for complete glyph coverage.
- 🎬 **Multimedia :** PipeWire audio stack, pavucontrol, CAVA visualizer & screenkey.
- 📊 **Monitoring :** htop, btop, Fastfetch & Neofetch with tuned defaults.
- 💻 **Dev stack :** Node.js, TypeScript, Go, Rust, Python, Ruby, Docker & essential CLI tools.
- 📂 **Project workspace :** automatically creates ```~/projects``` directory.
- 🌐 **Flatpak support :** Flathub enabled and OBS Studio auto-installed.
- 🌍 **Localization :** Europe/Paris timezone with en_US default and French regional formats.

## 📂 Repository structure

```bash
❯ tree -a -I ".git*"
.
├── configuration.nix # module configuration
├── LICENSE.md        # MIT license
├── README.md         # this documentation
└── variables.nix     # define your user username

1 directory, 4 files
```

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```.

You need to update ```variables.nix``` to your user username, the default is `"typovrak"`.

Change it to your own login or a ```typovrak``` user will be created.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
sudo cp /etc/nixos/configuration.nix{,.bak}
cp ~/nixos{,.bak}
cp ~/.config{,.bak}
cp ~/.local/share/applications/*.desktop{,.bak}
```
And other configurations if needed.

## ⬇️ Installation

### 🚀 Method 1 : Out-of-the-box

#### 1. Clone this repository
```bash
git clone https://github.com/typovrak/nixos.git ~/nixos
```

#### 2. Setup your user username in ```~/nixos/variables.nix```
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

### 🍴 Method 2 : Fork

Want to make it your **own** from the start ?

Fork the repo and clone **your version** instead.

#### 1. Fork this repository

Click on the fork button to create your own version of this NixOS configuration in your own GitHub.

#### 2. Clone your fork

```bash
git clone https://github.com/<YOUR_USERNAME>/nixos.git ~/nixos
```

#### 3. Setup your user username in ```~/nixos/variables.nix```
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

- Enable or disable modules by adding/removing their ```(import "${<MODULE_NAME>}/configuration.nix")``` line in configuration.nix.
- Updates modules by changing the ```rev = "<HASH> from git log -1"``` for each fetchGit entry.
- Adjust ```systemPackages``` or service options directly in the top-level configuration.
- Do whatever you want !

## 📚 Learn more

- 🧱 [NixOS official documentation](https://nixos.org/manual/nixos/stable/) : Complete guide to system configuration and module options.
- ⚙️ [Nixpkgs manual](https://nixos.org/manual/nixpkgs/stable/) : Reference for ```packages```, ```overlays```, ```fetchGit``` and module system internals.
- 📦 [Search Nix packages](https://search.nixos.org/packages) : Find and inspect packages available in the Nix ecosystem.
- 🖼️ [Catppuccin themes](https://github.com/catppuccin) : Official Catppuccin color schemes for terminals, apps, and desktops.
- 🧠 [Zero to Nix](https://zero-to-nix.com/) : A modern and beginner friendly guide to Nix, flakes and system management.

## 🌐 Discover my NixOS system portal

Dive into [typovrak.tv/nixos](https://typovrak.tv/nixos) Catppuccin mocha green themed **gateway** to my GitHub and NixOS setup.

Browse **every module**, example and config in a sleek with an interactive interface that feels just like your desktop.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://typovrak.tv/coffee)

## 💬 Join the Typovrak community on Discord 🇫🇷

If you've ever ```rm -rf```ed your config by mistake or rebuilt for the 42nd time because a semicolon was missing…

You're not alone, **Welcome home !**

🎯 [Join us on Discord »](https://typovrak.tv/discord)

🧭 What you’ll find is :

- ```💻 #nixos-setup``` - get help with modules, rebuilds and configs.
- ```🌐 #web-dev``` - talk JS, TypeScript, React, Node and more.
- ```🧠 #open-source``` - share your repos, contribute to others and discuss FOSS culture.
- ```⌨️ #typing``` - layouts, mechanical keyboards and speed goals.
- ```🎨 #ricing``` - dotfiles, theming tips and desktop screenshots.

*Everyone's welcome no matter how many times you've broken your system ~~(except for Windows users)~~ 😄*

---

<p align="center"><i>Made with 💜 by <a href="https://typovrak.tv">typovrak</a></i></p>
