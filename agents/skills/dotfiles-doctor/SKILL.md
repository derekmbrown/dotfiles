---
name: dotfiles-doctor
description: Use when checking this dotfiles repo for broken symlinks, shell syntax errors, install script issues, or unsafe committed secrets.
---

# Dotfiles Doctor

When checking dotfiles:

- Run `zsh -n` on any `.zsh` files that changed
- Check symlinks with `ls -l` and `test -e`
- Avoid committing secrets, tokens, private keys, `.env` files, or auth files
- Prefer idempotent install scripts
- Summarize issues clearly with file paths
