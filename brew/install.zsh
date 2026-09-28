#!/usr/bin/env zsh
set -euo pipefail

export NONINTERACTIVE=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_CONFIRM=1

echo "Checking Homebrew..."
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed."
fi

echo "Updating Homebrew..."
brew update

echo "Installing brew taps..."
taps=(
  cloudflare/cloudflare
  hashicorp/tap
  jesseduffield/lazydocker
  mostlygeek/llama-swap
  ngrok/ngrok
  nikitabobko/tap
  osx-cross/arm
  osx-cross/avr
  pilat/devbox
  qmk/qmk
  warrensbox/tap
)

for tap in "${taps[@]}"; do
  if brew tap | grep -qx "$tap"; then
    echo "Tap already installed: $tap"
  else
    brew tap "$tap"
    brew trust --tap cloudflare/cloudflare
  fi
done

echo "Installing brew packages..."
packages=(
  python@3.14
  awscli
  awslogs
  bat
  cloudflared
  colima
  libtiff
  composer
  ffmpeg
  flyctl
  fzf
  gastown
  gh
  git
  git-delta
  glow
  go
  gum
  hashcat
  htop
  httpie
  jq
  llama-swap
  minikube
  ncdu
  neovim
  node@22
  nvm
  ollama
  opentofu
  p7zip
  perl
  pet
  pi-coding-agent
  pipx
  pyenv
  sesh
  sevenzip
  speedtest-cli
  symfony-cli
  sqlite
  tfswitch
  tmux
  tree
  wifi-password
  yt-dlp
  z
  zoxide
  warrensbox/tap/tfswitch
)

for package in "${packages[@]}"; do
  if brew list --formula "$package" >/dev/null 2>&1; then
    echo "Package already installed: $package"
  else
    brew install --yes "$package"
  fi
done

echo "Installing brew casks..."
casks=(
  aerospace
  bitwarden
  codex
  claude-code
  cmux
  cursor
  discord
  docker-desktop
  firefox
  font-cascadia-mono
  font-fira-code
  ghostty
  google-chrome
  grandperspective
  hammerspoon
  iexplorer
  imazing
  iterm2
  itsycal
  karabiner-elements
  maccy
  macdown
  ngrok
  nimbalyst
  rectangle
  sequel-ace
  slack
  spotify
  stats
  visual-studio-code
  vlc
  wave
  zed
)

for cask in "${casks[@]}"; do
  if brew list --cask "$cask" >/dev/null 2>&1; then
    echo "Cask already installed: $cask"
  else
    brew install --cask --yes "$cask"
  fi
done

echo "Cleaning up..."
brew cleanup

echo "Homebrew setup complete."