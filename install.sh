#! /bin/sh

cd $(dirname $0)
for i in user.*; do
  src=$(pwd)/$i
  dst=$HOME/$(echo $i | sed -e "s/^user//")

  ln -i -s "$src" "$dst"
done

