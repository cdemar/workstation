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

# --- 9. AWS CLI ---
# Credentials are read from 1Password at shell start.
# If 1Password isn't signed in, the variables are silently skipped —
# run `eval $(op signin)` then `source ~/.zshrc` to load them.
export AWS_ACCESS_KEY_ID=$(op read "op://Private/AWS Access Key/access key id" 2>/dev/null)
export AWS_SECRET_ACCESS_KEY=$(op read "op://Private/AWS Access Key/secret access key" 2>/dev/null)
export AWS_DEFAULT_REGION="us-west-2"
export PATH="$HOME/work/Personal_Proj/scripts:$PATH"
