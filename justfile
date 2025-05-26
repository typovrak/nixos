default:
	@just --list

# Auto-format the source tree
fmt:
	treefmt

# Show the current state of the project
show:
	just dont-fuck-my-build
	just om show .

# Ensure no untracked or uncommitted .nix files are left out
dont-fuck-my-build:
	git ls-files --others --exclude-standard -- '*.nix' | xargs -r git add -v | lolcat 2> /dev/null
	nix-shell -p lolcat --run 'echo "No chance your build is fucked! 👍" | lolcat 2> /dev/null'

# Run the 'omnix' tool with the provided arguments
om *ARGS:
	nix run github:juspay/omnix -- {{ ARGS }}

# Check the health of the project
health:
	just dont-fuck-my-build
	just om health .

# Clean up build artifacts and temporary files
clean:
	rm -rfv result
	quick-results

# Update a single flake input using a nice little tool created by vimjoyer
single-update:
	nix run github:vimjoyer/nix-update-input

# Update dependencies and the Nix flake lock file, committing the changes
update:
	just dont-fuck-my-build
	nix flake update --commit-lock-file

# Update dependencies and the Nix flake lock file without committing the changes
update-no-commit:
	just dont-fuck-my-build
	nix flake update


# Check the project using Nix flake and other tools
check *ARGS:
	just dont-fuck-my-build
	nix flake check --impure --no-build {{ ARGS }}
	nix-shell -p lolcat --run 'echo "[CHECK] Finished." | lolcat 2> /dev/null'
