link() {
  local src="$1"
  local dest="$2"

  mkdir -p "${dest:h}"
  rm -rf "$dest"
  ln -s "$src" "$dest"
}
