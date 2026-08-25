# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## What this is

This folder holds the canonical, git-tracked copy of the user's *global* Claude Code instructions. `claude/CLAUDE.md` is not documentation about this folder — it's the payload: `~/.claude/CLAUDE.md` is a symlink to it, so editing either path edits the same file live, with no copy/sync step. Editing it changes what every Claude Code session on this machine sees as global instructions, project-independent.

Don't confuse this with the convention used elsewhere in this repo, where a folder's own `AGENTS.md` describes *that folder*.
