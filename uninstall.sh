#!/bin/sh

# quiet mode: suppress all echos if -q flag passed
echoloud() { builtin echo "$@"; }
[ "$1" = "-q" ] && { echo() { :; }; shift; }

echo -e '\n\U23F3 Uninstalling dco...'
if rm -f ~/.local/share/bash-completion/completions/dco ~/.bashrc.d/dco.bashrc; then
    echo -e '\n\U1F5D1 UNINSTALLATION COMPLETE\n'
    exit 0
fi

echoloud -e "\U274C <<< ERROR >>> Uninstallation failed"
exit 1