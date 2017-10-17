#!/bin/bash

function HandleFail
{
	tput setaf 1
	echo "="
	echo "=   FAILURE"
	echo "="
	tput sgr0
	exit 1
}

function HandleSuccess
{
	tput setaf 2
	echo "="
	echo "=   SUCCESS"
	echo "="
	tput sgr0
	exit 0
}

# Set current directory to the one containing this script
cd "$(dirname "$0")"

LOCAL=""

if [ "$1" == "rust" ]; then
  echo "Building and copying Rust executable"
  pushd ../tinygtkrs
  cargo build --release || HandleFail
  popd
  sudo cp ../tinygtkrs/target/release/tinygtkrs /usr/${LOCAL}bin/tinygtk  || HandleFail
elif [ "$1" == "cpp" ]; then
  echo "Building and copying C++ executable"
  pushd ../tinygtkcpp
  make
  popd
  sudo cp ../tinygtkcpp/a.out /usr/${LOCAL}bin/tinygtk  || HandleFail
else
  echo "Missing argument. Specify rust or cpp."
  exit
fi

sudo mkdir -p /usr/${LOCAL}share/applications/               || HandleFail
sudo cp tinygtk.desktop /usr/${LOCAL}share/applications/     || HandleFail
sudo mkdir -p /usr/${LOCAL}share/icons/hicolor/48x48/apps/   || HandleFail
sudo cp icon-48.png /usr/${LOCAL}share/icons/hicolor/48x48/apps/tinygtk.png || HandleFail
sudo gtk-update-icon-cache /usr/${LOCAL}share/icons/hicolor  || HandleFail
HandleSuccess
