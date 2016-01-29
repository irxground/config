alias ls="ls -G"
alias ll="ls -al"
alias git-ammend="git commit --amend --no-edit"
alias git-delete-branch="git branch --merged|egrep -v '\\*|develop|master'|xargs git branch -d"

# for Mac OS
has ldd || alias ldd="otool -L"

function reload-alias() {
  source "$BASH_SOURCE"
}
