# Updated Mac Setup & Dotfiles

This repository contains my personal system configurations, managed via **GNU Stow**. It uses a single **Brewfile** to manage every CLI tool, Desktop App, and Mac App Store application.

---

## Quick Start (New Machine)

### 1. Install Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Clone the Repo:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
```

### 3. Sync All Software (The Master Command):

This will install every tool listed below, including App Store apps, and GUI casks.

```bash
cd ~/dotfiles/brew
brew bundle
```

### 4. Deploy Configurations (Stow):

This creates symlinks from the repo to your home directory.
**Note**: macOS creates a default `.zshrc`. You must remove it before Stowing, or the symlink will fail.

```bash
rm ~/.zshrc
cd ~/dotfiles
stow zsh nvim wezterm
```

### 4.5 Sanity Check

```bash
.zshrc -> dotfiles/zsh/.zshrc
```

```bash
.config/nvim -> ../dotfiles/nvim/.config/nvim
```

```bash
.config/wezterm -> ../dotfiles/wezterm/.config/wezterm
```

---

## System Settings

### Network & Security

- **Service Order**: `USB 10/100/1000 LAN` -> `Wi-Fi` -> `Thunderbolt Bridge`.
- **Spotlight**: Disable categories like Events, Fonts, Images, Movies, and Siri Suggestions (use Raycast instead).

### Initial Personalization

- **Trackpad**: `System Settings > Trackpad` -> "Tap to Click" On.
- **Dock**: `Desktop & Dock` -> "Automatically hide" On, "Show recent apps" Off.
- **Keyboard**: Disable "Correct spelling", "Capitalize words", and "Predictive text".

## Software Stack

### PM Power Tools

- **VisiData (`vd`)**: Instant terminal-based spreadsheet exploration.
- **Pandoc**: Convert Markdown specs into professional PDFs/Docs.
- **HTTPie (`http`)**: Human-friendly API testing and JSON inspection.
- **Taskwarrior (`task`)**: High-speed task management for daily sprints.
- **Lazygit**: Visual Git status to track development velocity.

### CLI Utilities & Shell

- **Shell**: Zsh + `powerlevel10k`, `zsh-autosuggestions`, and `syntax-highlighting`.
- **Navigation**: `zoxide` (smart `cd`) and `fzf` (fuzzy finder).
- **Editor**: Neovim (`nvim`) with custom Lua configuration.
- **Modern Tools**: `eza` (improved `ls`), `ripgrep` (fast search), and `htop` (system monitor).

### GUI Applications (Casks)

- **Browsers**: Arc, Zen.
- **Productivity**: Obsidian, 1Password, Raycast, Lookaway.
- **Communication**: Discord, Slack, Zoom, WhatsApp.
- **Specialized**: Thinkorswim, Logos, Gopanda2, OBS, VMware Fusion.

---

## Python Workflow

I use Virtual Environments to keep the system Python clean:

- **Create**:
  ```bash
  python3 -m venv venv
  ```
- **Activate**:
  ```bash
  source venv/bin/activate
  ```
  - Add what you want like `pyperclip`, `boto3` by doing
  ```bash
  pip install pachage_name
  ```
- **Deactivate**:
  ```bash
  deactivate
  ```
- **Cleanup**:
  ```bash
  rm -rf venv
  ```

---

## Maintenance

I use custom aliases (defined in `.zshrc`) to keep the system healthy:
Alias | Description
-------- | -----------
`reload` | Refresh shell (`source ~/.zshrc`)
`z` | Smart `cd` (remembers paths)
`v` | Open Neovim
`CTRL+R` | History search in the terminal.
`find . \| fzf` | Fuzzy finder for files and directories.
`ls` | Run `eza` with icons and git status
`brew-sync` | Update, upgrade, and cleanup Homebrew
`brew doctor` | Check for Issues: If you're having issues

### Keeping the Brewfile in Sync

If you install a new app and want it saved to this repository, run:

```bash
cd ~/dotfiles/brew
brew bundle dump --describe --force
```

for myself I need to add GoPanda2 manually
