#!/usr/bin/env bash

set -e

if command -v go &> /dev/null; then
    sudo rm -rf /usr/local/go/
    sed -i '/export GOPATH=$HOME\/go/d' ~/.profile
    export PATH=$(echo $PATH | sed 's|/usr/local/go/bin:||')

    echo "Go removed successfully."
    echo "Update your shell environment by running 'source ~/.profile'"
else
    echo "Go is not installed. Nothing to remove."
fi
