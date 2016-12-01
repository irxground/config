alias cd="silent-pushd"
alias dirs="dirs -v"
alias ls="ls -G"
alias ll="ls -al"
alias diff="diff -u"
alias vim-sjis="vim -c ':e ++enc=cp932'"
alias vim-eucjp="vim -c ':e ++enc=euc-jp'"
alias colordiff="colordiff -u"
alias git-ammend="git commit --amend --no-edit"
alias git-delete-branch="git branch --merged|egrep -v '\\*|develop|master'|xargs git branch -d"
alias be="bundle exec"

# for Mac OS
has ldd || alias ldd="otool -L"

function silent-pushd() {
  pushd "$@" > /dev/null
}

function reload-alias() {
  source "$BASH_SOURCE"
}
