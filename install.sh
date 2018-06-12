#!/bin/bash

function has() {
  type "$1" > /dev/null 2>&1
}

function make_link() {
  local _src="$1"
  if [ -z "$2" ]; then
    local _dst="$(basename "$1")"
  else
    local _dst="$2"
  fi

  if [ -L "$_dst" ]; then
    if [ "$_src" = "$(readlink "$_dst")" ]; then
      echo "Skip: $_src"
    else
      rm "$_dst"
      _make_link "$_src" "$_dst"
    fi
  else
    if [ -e "$_dst" ]; then
      echo "Exist: $_src"
    else
      _make_link "$_src" "$_dst"
    fi
  fi
}

function _make_link() {
  local _src="$1"
  local _dst="$2"

  printf "ln -s %s %s\n" "$_src" "$_dst"
  ln -s "$_src" "$_dst"
}

echo "*** Install dotfile ***"
cd $(dirname $0)
for i in $(ls "dotfiles")
do
  make_link "${PWD}/dotfiles/$i" "${HOME}/.$i"
done

echo "*** Install bin ***"
mkdir -p "${HOME}/bin"
for i in $(ls "bin")
do
  make_link "${PWD}/bin/$i" "${HOME}/bin/$i"
done

if has brew; then
  cd "$HOME/bin"
  echo "*** Install bin (brew) ***"
  if which brew > /dev/null; then
    # make_link $(brew --prefix)/share/git-core/contrib/workdir/git-new-workdir
    make_link $(brew --prefix)/share/git-core/contrib/diff-highlight/diff-highlight
  fi
fi

if has git; then
  echo "*** include gitconfig_shared ***"
  echo "git config --global include.path .gitconfig_shared"
  git config --global include.path .gitconfig_shared
fi
