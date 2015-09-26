if has nodebrew; then
  export NODEBREW_ROOT="$HOME/.nodebrew"
  prepend_path "$NODEBREW_ROOT/current/bin"
fi
