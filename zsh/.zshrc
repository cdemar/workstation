# --- 1. THE PATH ---
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# --- 2. POWERLEVEL10K INSTANT PROMPT ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- 3. LOAD THE THEME (Must be before Oh My Zsh) ---
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# --- 4. OH MY ZSH CORE ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="" # Leave blank because we loaded p10k above manually
plugins=(git)
source $ZSH/oh-my-zsh.sh

# --- 5. LOAD REMAINING HOMEBREW TOOLS ---
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Initialize Zoxide & FZF
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# --- 6. ALIASES ---
export EDITOR='nvim'
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias v="nvim"
alias reload="source ~/.zshrc"
alias brew-sync="brew update && brew upgrade && brew upgrade --cask && brew cleanup --prune=all && brew autoremove"
