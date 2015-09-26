alias ls="ls -G"
alias ll="ls -al"
alias vi="vim"
alias git-ammend="git commit --amend --no-edit"

# for Mac OS
has ldd || alias ldd="otool -L"

function reload-alias() {
  source "$BASH_SOURCE"
}
