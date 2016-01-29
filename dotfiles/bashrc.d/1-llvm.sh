if has brew; then
  llvm=$(brew --prefix llvm 2> /dev/null)
  if [ -d "$llvm" ]; then
    export PATH=$PATH:${llvm}/bin
  fi
fi
