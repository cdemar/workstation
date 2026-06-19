.PHONY: install sync update status

# Bootstrap a new machine from scratch
install:
	brew bundle --file=brew/Brewfile
	stow -v -d . -t ~ brew nvim wezterm zsh

# Pull latest changes and re-stow configs
sync:
	git pull
	stow -v -d . -t ~ brew nvim wezterm zsh

# Update brew + nvim plugins
update:
	brew update && brew upgrade && brew upgrade --cask --greedy && brew cleanup --prune=all && brew autoremove
	nvim --headless "+Lazy! sync" +qa

# Show what's outdated without changing anything
status:
	@echo "=== Brew ==="
	@brew outdated
	@echo ""
	@echo "=== Nvim plugins ==="
	@nvim --headless "+Lazy! check" +qa
