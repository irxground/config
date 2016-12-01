if has brew && [ -x "$(brew --prefix)/bin/android" ]; then
  export ANDROID_HOME=$(brew --prefix)/opt/android-sdk
fi

if [ -z "$ANDROID_HOME" ] && [ -d "$HOME/Library/Android/sdk" ]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
fi

prepend_path "${ANDROID_HOME}/tools"
prepend_path "${ANDROID_HOME}/platform-tools"
