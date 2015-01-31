#!/bin/bash

echo "*** Install dotfile ***"
cd $(dirname $0)
for i in user.*; do
  src=${PWD}/$i
  dst=${HOME}/$(echo $i | sed -e "s/^user//")
  if [ "$src" = "$(readlink "$dst")" ]; then
    echo "Skip: $dst"
  else
    printf "ln -i -s %s %s\n" "$src" "$dst"
    ln -i -s "$src" "$dst"
  fi
done

echo "*** Install bin ***"
mkdir -p "${HOME}/bin"
for i in $(ls "bin") ; do
  src=${PWD}/bin/$i
  dst=${HOME}/bin/$i
  if [ "$src" = "$(readlink "$dst")" ]; then
    echo "Skip: $dst"
  else
    printf "ln -i -s %s %s\n" "$src" "$dst"
    ln -i -s "$src" "$dst"
  fi
done

