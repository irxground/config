if has brew && [ -x "$(brew --prefix)/bin/android" ]; then
  export ANDROID_HOME=$(brew --prefix)/opt/android-sdk
fi
