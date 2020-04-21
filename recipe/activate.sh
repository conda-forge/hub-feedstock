if [ -n "$ZSH_VERSION" ]; then
    export CF_ALIAS_GIT_BACKUP=$(alias -L | grep ' git=')
else
    export CF_ALIAS_GIT_BACKUP=$(alias -p | grep  'git=')
fi

alias git=$(which hub)
