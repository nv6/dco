#!/usr/bin/env bash

MIN_CURL="7.73.0"
CUR_CURL=$(curl -V | head -n 1 | awk '{print $2}')
if [ "$(printf '%s\n' "$MIN_CURL" "$CUR_CURL" | sort -V | head -n 1)" != "$MIN_CURL" ]; then
    echo -e "\n\U274C <<< ERROR >>> Unsupported curl version $CUR_CURL, must be $MIN_CURL or higher!"
    exit 1
fi

REPO='https://raw.githubusercontent.com/nv6/dco/master'
export COMPLETIONS_PATH="$HOME/.local/share/bash-completion/completions"

# quiet mode: suppress all echos if -q flag passed
[ "$1" = "-q" ] && { echo () {:;}; shift; } || DEBUG=1

if [[ ! -d "$COMPLETIONS_PATH" || ! -d ~/.bashrc.d ]]; then
    echo -e '\n\U23F3 Creating directory structures...'
    mkdir -p "$COMPLETIONS_PATH" ~/.bashrc.d
fi

echo -e '\n\U23F3 Installing dco...'
curl -fsLO --output-dir ~/.bashrc.d "$REPO/dco.bashrc"

echo -e '\n\U1F50E Checking for .bashrc.d autoload in .bashrc...'
if ! grep -qF 'if [ -d ~/.bashrc.d ]; then' ~/.bashrc; then
    echo -e '\n\U1F527 Patching .bashrc to autoload .bashrc.d'
    curl -fsL "$REPO/dirloader.bashrc" >> ~/.bashrc
fi

echo -e '\n\U1F50E Installing docker compose completions for dco...\n'
docker completion bash | awk -f <(curl -fsL "$REPO/dco-bash.awk")
(( DEBUG )) && diff --color=always -u <(docker completion bash) "$COMPLETIONS_PATH/dco" | tail -n+3

echo -e '\n\U2705 INSTALLATION COMPLETE'
echo -e '\U1F4A1 Close and reopen current terminal to activate, or run `. ~/.bashrc`\n'
