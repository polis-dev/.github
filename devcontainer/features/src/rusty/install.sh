#!/bin/sh
set -e

FAVORITE="${FAVORITE:-blue}"

has_bin() { command -v "$1" >/dev/null 2>&1; }
install_script(){ cat "$2" > "/usr/local/bin/$1" && chmod +x "/usr/local/bin/$1"; }

echo "Activating feature 'rusty'"

# Ensure rust/cargo/etc. are isntalled.
has_bin cargo || {
  echo "Installing rust..."
  curl https://sh.rustup.rs -sSf | sh -s -- -y
  export PATH="$HOME/.cargo/bin:$PATH"
}

cargo install cargo-edit
cargo install cargo-release
cargo install cargo-watch
cargo install cargo-update
cargo install cargo-tree
cargo install cargo-outdated
cargo install cargo-expand
cargo install cargo-bloat
cargo install cargo-deny

echo "Activated feature 'rusty'"
