# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## What this is

A personal dotfiles repo: one folder per tool, each holding that tool's config file(s) more or less as the tool expects to find them (e.g. `tmux/tmux.conf`, `wezterm/wezterm.lua`). There's no build, lint, or test pipeline, and no `install.sh`/stow setup wiring these into `$HOME` — most of these files are plain backups, not symlinked from their real config location, so a change only takes effect once it's copied (or manually symlinked) to where the tool actually reads from. `claude/CLAUDE.md` is the one exception: it's symlinked live from `~/.claude/CLAUDE.md` (see [`claude/AGENTS.md`](claude/AGENTS.md)). Validate a change by reloading it in the tool itself, not by running anything in this repo.

## Folders

Folders with real depth to explain carry their own `AGENTS.md` — read that file before editing inside them. Everything else is a single, largely self-explanatory config file, noted inline below.

| Folder | Contents | Details |
| --- | --- | --- |
| `nvim/` | Neovim config (Lua, `lazy.nvim`) | [`nvim/AGENTS.md`](nvim/AGENTS.md) |
| `wezterm/` | WezTerm terminal config (Lua) | [`wezterm/AGENTS.md`](wezterm/AGENTS.md) |
| `herdr/` | `herdr` tool config; directory also holds gitignored runtime files | [`herdr/AGENTS.md`](herdr/AGENTS.md) |
| `claude/` | Canonical, git-tracked copy of the user's *global* Claude Code instructions (`claude/CLAUDE.md`), symlinked live from `~/.claude/CLAUDE.md` | [`claude/AGENTS.md`](claude/AGENTS.md) |
| `alacritty/` | `alacritty.yml` — colorscheme only | — |
| `ghostty/` | `ghostty/config` — font, theme | — |
| `glow/` | JSON style themes for `glow` (terminal Markdown renderer) | — |
| `tmux/` | `tmux/tmux.conf` | — |
| `vimwiki/` | Personal notes/journal in Markdown (vimwiki). Content, not configuration — don't edit unless asked to. | — |

Loose files at the repo root aren't tool folders: `.ideavimrc` (IdeaVim config for JetBrains IDEs), `karabiner-gav.json` (Karabiner-Elements keyboard remapping), `intellij-settings.zip` (exported IntelliJ settings archive, binary).
