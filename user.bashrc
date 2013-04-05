
case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac
alias vi="vim"
alias gitpull="git pull --rebase --stat"


user="\[\e[36m\]\u@\h\[\e[0m\]"
path="\[\e[33m\]:\w\[\e[0m\]"
prompt_="\$"
prompt="\[\e[32m\]${prompt_}\[\e[0m\]"
export PS1="${user}${path}\n${prompt} "

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

