---
name: dotfiles-doctor
description: Validates the dotfiles repos.
---

# Dotfiles Doctor

When checking dotfiles:

- Run `zsh -n` on any `.zsh` files that changed
- Check symlinks with `ls -l` and `test -e`
- Avoid committing secrets, tokens, private keys, `.env` files, or auth files
- Prefer idempotent install scripts
- Summarize issues clearly with file paths
