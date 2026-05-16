# --- 1. THE PATH ---
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# --- 2. POWERLEVEL10K INSTANT PROMPT ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- 3. LOAD THE THEME ---
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# --- 4. LOAD HOMEBREW TOOLS ---
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Initialize Zoxide & FZF
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# --- 5. ALIASES ---
export EDITOR='nvim'
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias v="nvim"
alias reload="source ~/.zshrc"

# --- 6. HISTORY ---
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS SHARE_HISTORY

# --- 7. NODE (fnm) ---
eval "$(fnm env --use-on-cd)"

# --- 8. PYTHON ---
export PATH="$HOME/Library/Python/3.14/bin:$PATH"
