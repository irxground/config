#!/bin/bash

function has() {
  type "$1" > /dev/null 2>&1
}

function make_link() {
  local _src=$1
  local _dst=$2

  if [ "$_src" = "$(readlink "$_dst")" ]; then
    echo "Skip: $_src"
  else
    printf "ln -s %s %s\n" "$_src" "$_dst"
    ln -s "$_src" "$_dst"
  fi
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
    ln -s $(brew --prefix)/share/git-core/contrib/workdir/git-new-workdir
    ln -s $(brew --prefix)/share/git-core/contrib/diff-highlight/diff-highlight
  fi
fi

if has git; then
  echo "*** include gitconfig_shared ***"
  echo "git config --global include.path .gitconfig_shared"
  git config --global include.path .gitconfig_shared
fi
