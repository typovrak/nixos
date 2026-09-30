# 🛠️ Contributing

> "Talk is cheap. Show me the code."
> — Linus Torvalds

Bug fixes and new modules are welcome.

## 💬 Before you start

- **Questions and setup help:** ask in ```#nixos-setup``` on [Discord](https://typovrak.tv/discord). Issues are for bugs and feature requests.
- **Bugs and feature requests:** open an issue with one of the templates. For anything bigger than a typo, wait for an answer before writing code, so you don't spend time on a change that won't be merged.
- **Security issues:** follow the [security policy](SECURITY.md) and never open a public issue.

## 🧪 Test your change

To test a module, clone your fork anywhere, then replace the module's ```fetchGit``` entry in your ```configuration.nix``` with the path to your clone:

```nix
nixos-zsh = /home/<YOUR_USER_USERNAME>/nixos-zsh;
```

To test the main configuration, edit ```~/nixos/configuration.nix``` directly, since ```/etc/nixos/configuration.nix``` links to it.

Then apply it:

```bash
sudo nixos-rebuild test
```

```test``` activates the new configuration without adding a boot entry, so a reboot brings your previous system back. Run ```sudo nixos-rebuild switch``` once everything works.

## 🧱 Module conventions

Start from an existing module, like [nixos-git](https://github.com/typovrak/nixos-git), rather than from scratch.

- **One tool or feature per module:** ```nixos-<tool>``` configures ```<tool>```, and unrelated packages go in another module.
- **No hardcoded user:** read ```username``` from ```config.username```, and ```group``` and ```home``` from ```config.users.users```, in a ```let``` block.
- **Files in ```~```:** copy them in ```system.activationScripts```, then set the owner with ```chown``` and the permissions with ```chmod``` (usually ```600``` for files, ```700``` for directories).
- **Theme:** Catppuccin, Mocha by default, with the green accent.
- **Unfree packages:** say so in the pull request description.
- **Indentation:** tabs, like the existing ```.nix``` files.

## 📝 Commits

Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/): ```type(scope): description```.

```bash
feat(ghostty): add catppuccin mocha green theme
fix(nvim): replace unmaintained colorizer plugin
docs(readme): fix backup commands
```

Use ```feat``` for new behavior, ```fix``` for bugs, ```docs``` for documentation and ```chore``` for the rest. The scope is the tool or area you touched.

## 🔀 Pull requests

- One topic per pull request: a theme fix and a new package are two pull requests.
- Fill in the template with what changed and how you tested it.
- Update the README when the behavior changes.

A merged module change reaches the main configuration once its ```rev``` is updated in ```configuration.nix```.

## 📄 License

By contributing, you agree to release your work under the MIT license of this repository.

---

<p align="center"><i>💜 Thanks for helping improve Typovrak NixOS!</i></p>
