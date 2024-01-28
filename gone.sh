#!/bin/bash
set -e

if command -v go &> /dev/null; then
    rm -rf usr/local/go
    sed -i '/export GOPATH=$HOME\/go/d' ~/.profile
    sed -i '/export PATH=usr\/local\/go\/bin:$PATH/d' ~/.profile
    unset GOPATH
    export PATH=$(echo $PATH | sed 's/:$GOPATH\/bin//')
    source ~/.profile

    echo "Go removed successfully."
else
    echo "Go is not installed. Nothing to remove."
fi
