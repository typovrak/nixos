# 💜 Nixos

> Complete, modular NixOS setup covering shell, GUI, development tools, window manager, audio, fonts, theming and more.

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

## 🚀 Installation

### 1. Clone this repository
```bash
git clone https://github.com/typovrak/nixos.git ~/nixos
```

### 2. Setup your user username in ```~/nixos/nixos/variables.nix```
```bash
# ~/nixos/nixos/variables.nix

{ lib, ... }:

{
  options.username = lib.mkOption {
    type = lib.types.str;
    default = "<YOUR_USER_USERNAME>";
  };
}
```

### 3. Link into ```/etc/nixos```
```bash
sudo ln -sf ~/nixos/nixos/configuration.nix /etc/nixos/configuration.nix  
sudo ln -sf ~/nixos/nixos/variables.nix     /etc/nixos/variables.nix
```

### 4. Rebuild and switch
```bash
sudo nixos-rebuild switch
```

## 🔧 Customization

- Enable or disable modules by adding/removing their ```(import "${<MODULE_NAME>}/configuration.nix")``` line in configuration.nix.

- Updates modules by changing the ```rev = "<HASH> from git log -1"``` for each fetchGit entry.

- Adjust ```systemPackages``` or service options directly in the top-level configuration.

- Do whatever you want !

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
