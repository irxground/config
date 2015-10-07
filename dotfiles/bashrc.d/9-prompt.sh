__reset='\e[0m'
__u='\e[4m'
__red='\e[31m'
__green='\e[32m'
__yellow='\e[33m'
__blue='\e[34m'
__cyan='\e[36m'
__default='\e[39m'

__ps1_pre="${__green}${__u}\u${__default}@${__yellow}\h${__default}:${__cyan}\w${__reset}"
__ps1_post="\n\$ "

if has __git_ps1; then
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  GIT_PS1_SHOWUPSTREAM="verbose"
  GIT_PS1_SHOWCOLORHINTS=1
  PROMPT_COMMAND='__git_ps1 "$__ps1_pre" "$__ps1_post"'
  PS1=""
else
  PROMPT_COMMAND=""
  PS1="${__ps1_pre}${__ps1_post}"
fi
PS4="${__red}+${__default}"
