###### PATH ########
export PATH="~/.bin:$PATH"


##### Aliases ###########
# cd / path
alias ..='cd ..'
alias ...='cd .. ; cd ..'
function proj { cd ~/Dropbox/ruby/rails/$1; } # changing directory to code project
alias mkdir='mkdir -p'

#Ruby/Rails
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"
alias b="bundle"
alias be="bundle exec"

# powder
alias p='powder'
alias pr='powder restart'
alias pl='powder applog'
alias ps='powder status'
alias pdown='powder down'
alias pup='powder up'

# ls
alias ls="ls -F"
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'

# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gwhat="git whatchanged"

# Editor
alias v=mvim
alias vc=vim

#others
alias ctags='/usr/local/bin/ctags'
alias t="tail -f"
alias reload='. ~/.bash_profile' # reload this file

# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

alias top='top -o cpu' # ordenado pela CPU
alias topm='top -o vsize' # ordenado pela Memoria

alias df='df -h' # Show disk usage

killhard() {
  kill -9 "$1"
}



####### History ###############
export HISTCONTROL=ignoredups
export HISTFILESIZE=3000
export HISTIGNORE="l:ls:cd:[bf]g:exit:..:...:ll:lla"
alias h=history
hf(){
  grep "$@" ~/.bash_history
}

###### Editors ###############
export EDITOR='mvim'
export GIT_EDITOR='vim'


###### Variaveis de Ambiente
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

####### Prompt ###############
function prompt {
  local LIGHT_RED="\[\033[1;31m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local NO_COLOUR="\[\033[0m\]"

  local TITLEBAR='\[\033]0;\u@\h\007\]'

  source ~/.git-completion.bash

  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWUNTRACKEDFILES=true
  export GIT_PS1_SHOWUPSTREAM=auto
  export GIT_PS1_SHOWSTASHSTATE=true

  PS1="$TITLEBAR\n\w/$LIGHT_GREEN\$(__git_ps1 ' (%s)') $LIGHT_RED\$(~/.rvm/bin/rvm-prompt i v g)\n$NO_COLOUR$ "
}
prompt

############ Search ###################
# Use ack for grepping and find if ack is available
if type -P ack &>/dev/null ; then
  g(){
    ack "$*" --all-types --color-match=green --color-filename=blue --smart-case
  }
  gw(){
    ack "$*" --all-types --color-match=green --color-filename=blue --word-regexp --smart-case
  }
  f(){
    ack -i -g ".*$*[^\/]*$" | highlight blue ".*/" green "$*[^/]"
  }
else
  g(){
    grep -Ri $1 *
  }
  f(){
    find . -iname "$1"
  }
fi

########## For local configuration ########
if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi

########## Hello Messsage #################
echo -ne "Uptime: "; uptime
echo -ne "Server time is: "; date

