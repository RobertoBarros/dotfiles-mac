source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/util/bashmarks.sh


# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


### PATH Postgres.app bin psql
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"



### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
