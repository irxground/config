#! /bin/sh

cd $(dirname $0)
for i in user.*; do
  src=${PWD}/$i
  dst=${HOME}/$(echo $i | sed -e "s/^user//")
  if [ "$src" = "$(readlink "$dst")" ]; then
    echo "Skip: $dst"
  else
    ln -i -s "$src" "$dst"
  fi
done

