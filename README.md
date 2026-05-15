# Mac Setup & Dotfiles

Personal system configuration managed with **GNU Stow** and automated with **Make**. A single Brewfile tracks every CLI tool, desktop app, and Mac App Store application.

---

## Quick Start (New Machine)

### 1. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Clone the repo

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
```

### 3. Bootstrap everything

Installs all brew tools, casks, and Mac App Store apps, then symlinks all configs:

```bash
cd ~/dotfiles
make install
```

> **Note**: macOS creates a default `.zshrc` on first boot. Remove it before running `make install` or stow will fail:
> ```bash
> rm ~/.zshrc
> ```

### 4. Sanity check

```bash
~/.zshrc            -> dotfiles/zsh/.zshrc
~/.config/nvim      -> dotfiles/nvim/.config/nvim
~/.config/wezterm   -> dotfiles/wezterm/.config/wezterm
~/Brewfile          -> dotfiles/brew/Brewfile
```

---

## Makefile Commands

| Command | What it does |
|---|---|
| `make install` | Bootstrap a new machine — installs brew bundle + stows all configs |
| `make sync` | Pull latest dotfile changes and re-stow configs |
| `make update` | Update brew (all formulae + casks) and sync nvim plugins |
| `make status` | Show what's outdated across brew and nvim without changing anything |

---

## Software Stack

### Shell

- **Zsh** with **Powerlevel10k**, `zsh-autosuggestions`, and `zsh-syntax-highlighting`
- **zoxide** — smart `cd` that learns your most-visited directories
- **fzf** — fuzzy finder wired into shell history and file search

### Terminal

- **WezTerm** — GPU-accelerated terminal with native pane splitting

| Keybinding | Action |
|---|---|
| `Alt+s` | Split horizontal |
| `Alt+v` | Split vertical |
| `Alt+z` | Zoom/unzoom current pane |
| `Cmd+h/j/k/l` | Navigate panes |
| `Cmd+Shift+h/j/k/l` | Resize panes |
| `Cmd+t` | New tab |
| `Cmd+[` / `Cmd+]` | Previous / next tab |
| `Cmd+w` | Close pane |
| `Cmd+Shift+r` | Reload config |

### Editor — Neovim

Plugin-managed with **lazy.nvim**. Config lives in `nvim/.config/nvim/lua/`.

**LSP (via Mason):** TypeScript, HTML, CSS, Tailwind, GraphQL, Lua, Python, SQL, Emmet, ESLint

**Formatters:** Prettier (JS/TS/CSS/HTML/JSON/YAML/Markdown), Stylua (Lua), Black + isort (Python)

**Linters:** Pylint (Python), ESLint LSP (JS/TS)

| Keybinding | Action |
|---|---|
| `Space+ff` | Fuzzy find files |
| `Space+fs` | Live grep across project |
| `Space+fr` | Recent files |
| `Space+fc` | Find word under cursor |
| `gd` | Go to definition |
| `gR` | Show references |
| `K` | Hover documentation |
| `Space+ca` | Code actions |
| `Space+rn` | Rename symbol |
| `Space+mp` | Format file |
| `Space+D` | Buffer diagnostics |
| `]d` / `[d` | Next / previous diagnostic |
| `]h` / `[h` | Next / previous git hunk |
| `Space+hs` | Stage hunk |
| `Space+hb` | Git blame line |
| `Space+hd` | Diff against HEAD |
| `Space+ee` | Toggle file explorer |
| `Space+xw` | Workspace diagnostics (Trouble) |
| `Space+xt` | Todo list (Trouble) |
| `Space+wr` | Restore session |
| `Space+ws` | Save session |

### CLI Utilities

| Tool | Purpose |
|---|---|
| `eza` | Modern `ls` with icons and git status |
| `bat` | `cat` with syntax highlighting |
| `ripgrep` | Fast `grep` replacement |
| `fd` | Fast `find` replacement |
| `delta` | Syntax-highlighted git diffs |
| `lazygit` | Terminal UI for git |
| `gh` | GitHub CLI |
| `jq` | JSON processor |
| `fzf` | Fuzzy finder |
| `zoxide` | Smart `cd` |
| `htop` | System monitor |
| `pandoc` | Markdown → PDF/Docx conversion |

### Node

Managed with **fnm** (fast node version manager). Automatically switches versions per project via `.node-version` or `.nvmrc`.

```bash
fnm install 20        # install a version
fnm use 20            # switch to it
fnm default 20        # set as default
```

### Python

Uses **Python 3.14** (via Homebrew). Virtual environments keep the system Python clean:

```bash
python3 -m venv venv        # create
source venv/bin/activate    # activate
pip install package_name    # install packages
deactivate                  # exit
rm -rf venv                 # cleanup
```

### GUI Applications

| App | Purpose |
|---|---|
| Arc, Zen | Browsers |
| Obsidian | Notes (Markdown, local-first) |
| 1Password | Password manager |
| Raycast | Launcher / productivity |
| Claude + Claude Code | AI assistant |
| Discord, Slack, Zoom, WhatsApp | Communication |
| OBS | Screen recording / streaming |
| Spotify | Music |
| Thinkorswim | Trading platform |
| Logos | Bible study |
| GoPanda | Go (board game) client |
| Lookaway | Break reminders |
| AppCleaner | App uninstaller |
| Minecraft | Minecraft |

---

## Shell Aliases

| Alias | Command | Description |
|---|---|---|
| `ls` | `eza --color --long --git --icons` | Modern ls |
| `v` | `nvim` | Open Neovim |
| `reload` | `source ~/.zshrc` | Refresh shell |
| `z <dir>` | zoxide | Smart directory jump |

---

## System Settings (First Boot)

### Network
- **Service Order**: USB LAN → Wi-Fi → Thunderbolt Bridge

### Spotlight
- Disable: Events, Fonts, Images, Movies, Siri Suggestions (use Raycast instead)

### Personalization
- **Trackpad**: System Settings → Trackpad → "Tap to Click" On
- **Dock**: Desktop & Dock → "Auto-hide" On, "Show recent apps" Off
- **Keyboard**: Disable "Correct spelling", "Capitalize words", "Predictive text"

---

## Keeping the Brewfile in Sync

If you install a new app and want it tracked:

```bash
cd ~/dotfiles/brew
brew bundle dump --describe --force
```

> GoPanda must be added to the Brewfile manually after dumping.
