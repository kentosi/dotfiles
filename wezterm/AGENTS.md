# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## What this is

WezTerm terminal config, a single Lua file (`wezterm.lua`) built with WezTerm's `config_builder()` API. There is no build step or test suite.

## Running / testing changes

WezTerm watches this file and reloads automatically on save (`config.automatically_reload_config` is on by default) — no restart needed. `Cmd+R` inside WezTerm forces a manual reload if a change doesn't seem to apply.

## Notable non-obvious choices

- **`config.bypass_mouse_reporting_modifiers = "CMD"`** plus the `mouse_bindings` block below it: without this, Cmd-click on a link does nothing in apps that capture the mouse for their own use (e.g. Neovim with `mouse=a`), because the app's mouse reporting swallows the click before WezTerm's link-open logic sees it. This makes Cmd behave like the default Shift-bypass, so Cmd-click still opens hyperlinks. Don't remove this without confirming link-clicking still works inside mouse-capturing TUIs.
- **`LeftArrow`/`RightArrow` with `mods = "OPT"`** are rebound to send `\x1bb`/`\x1bf` (`Alt-b`/`Alt-f`). macOS's default Option-arrow sends a different escape sequence that zsh/readline don't recognize as word-back/word-forward; this mapping is what makes Option-arrow move by word in the shell. Keep this in sync with the shell's actual word-navigation bindings if those ever change.
