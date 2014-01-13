# vim: ft=sh

function try_read() {
  if [ -r "$1" ]; then
    . $1
  fi;
}

try_read ~/.bashrc_local

case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  function rmattr() {
    xattr -d com.apple.metadata:kMDItemWhereFroms $1
    xattr -d com.apple.quarantine $1
  }
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias ll="ls -al"
alias vi="vim"
alias grep="grep -i"
alias gitll="git ls-files"
alias gitadd='git add -A'
alias gitpull="git pull --rebase --stat --prune"
alias gitammend="git commit --amend --no-edit"
function mkcd() {
  mkdir -p $1 && cd $1
}

try_read "$GIT_COMPLETION/git-prompt.sh"
try_read "$GIT_COMPLETION/git-completion.bash"
try_read ~/work/config/completion-ruby/completion-ruby-all
if which npm > /dev/null; then . <(npm completion); fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which plenv > /dev/null; then eval "$(plenv init -)"; fi

export GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '

export PATH=$HOME/bin:$PATH
