alias ls="ls -G"
alias ll="ls -al"
alias diff="diff -u"
alias vim-sjis="vim -c ':e ++enc=cp932'"
alias colordiff="colordiff -u"
alias git-ammend="git commit --amend --no-edit"
alias git-delete-branch="git branch --merged|egrep -v '\\*|develop|master'|xargs git branch -d"
alias be="bundle exec"

# for Mac OS
has ldd || alias ldd="otool -L"

function reload-alias() {
  source "$BASH_SOURCE"
}
