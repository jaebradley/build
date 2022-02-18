source ~/.bash/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
PS1='\e[1;35m\s | \d \@ | \u@\h | \w$(__git_ps1 " (%s)") \$ \e[0m'

