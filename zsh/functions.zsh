#!/usr/bin/env zsh

link() {
  local src="$1"
  local dest="$2"

  mkdir -p "${dest:h}"
  rm -rf "$dest"
  ln -s "$src" "$dest"
}

_pi_run() {
  local pt="$1"
  echo "Prompt: $pt?"
  local ans
  ans=$(pi -p "$pt")
  echo "Answer: $ans"
}

pi-ask() { _pi_run "$*"; }
pi-reword() { _pi_run "Please reword this: $*"; }

dlist() {
  command -v docker >/dev/null || { echo "docker not found"; return 1; }

  echo "Images:"
  docker images
  echo
  echo "Containers:"
  docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}'
  echo
  echo "Volumes:"
  docker volume ls
  echo
  echo "Networks:"
  docker network ls
}

dnuke() {
  command -v docker >/dev/null || { echo "docker not found"; return 1; }

  echo "This will DELETE all Docker containers (running or not), images, volumes,"
  echo "networks, and build cache. This cannot be undone."
  local ans
  read -r "ans?Type 'y' to continue: "
  [[ "$ans" == "y" ]] || { echo "Aborted."; return 1; }

  local ids
  ids=$(docker ps -aq)
  [[ -n "$ids" ]] && docker rm -f ${=ids}
  docker system prune -a --volumes -f
  docker builder prune -a -f
  echo "Docker reset complete."
}
