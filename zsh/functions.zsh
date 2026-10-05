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
