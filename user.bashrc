# vim: ft=sh

case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias ll="ls -al"
alias vi="vim"
alias gitpull="git pull --rebase --stat --prune"
alias gitammend="git commit --amend --no-edit"
function mkcd() {
  mkdir -p $1 && cd $1
}

function try_read() {
  if [ -r "$1" ]; then
    . $1
  fi;
}

try_read ~/work/git/contrib/completion/git-prompt.sh
try_read ~/work/git/contrib/completion/git-completion.bash
try_read ~/work/config/completion-ruby/completion-ruby-all
which npm > /dev/null && . <(npm completion)

export GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '

try_read ~/.bashrc_local
