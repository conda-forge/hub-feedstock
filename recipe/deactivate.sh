if [ -n "$ZSH_VERSION" ]; then
    alias -p | grep -c git= >/dev/null && unalias git
else
    alias -L | grep -c git= >/dev/null && unalias git
fi

eval $CF_ALIAS_GIT_BACKUP
unset CF_ALIAS_GIT_BACKUP
