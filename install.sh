#!/bin/bash

function make_link() {
  local _src=$1
  local _dst=$2

  if [ "$_src" = "$(readlink "$_dst")" ]; then
    echo "Skip: $_src"
  else
    printf "ln -i -s %s %s\n" "$_src" "$_dst"
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

