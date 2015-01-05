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
    # xattr -d com.apple.metadata:kMDItemWhereFroms $@
    xattr -d com.apple.quarantine $@
  }
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias ..="cd .."
alias ll="ls -al"
alias ls-files="tree -if"
alias vi="vim"
alias cp="cp -i"
alias rm="rm -i"
alias grep="grep -i"
alias tree="tree -C"
alias ip="ifconfig | grep inet | tr -d '\t' | sort"
alias git-ll="git ls-files"
alias git-add='git add -A'
alias git-pull="git pull --rebase --stat --prune"
alias gitpull="git-pull"
alias git-ammend="git commit --amend --no-edit"
alias git-delete-branch="git branch --merged | grep -v '*' | xargs -I % git branch -d %"
function mkcd() {
  mkdir -p $1 && cd $1
}

export PATH=$HOME/bin:$PATH

if which brew > /dev/null; then . "$(brew --prefix)/etc/bash_completion"; fi
try_read "$GIT_COMPLETION/git-prompt.sh"
try_read "$GIT_COMPLETION/git-completion.bash"
try_read ~/work/config/completion-ruby/completion-ruby-all
if which npm > /dev/null; then . <(npm completion); fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
if which plenv > /dev/null; then eval "$(plenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
