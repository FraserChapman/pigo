#!/bin/bash
set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 <go_version>"
    echo "See https://go.dev/dl/ for available versions"
    exit 1
fi

GO_VERSION=$1
GO_URL="https://go.dev/dl/go$GO_VERSION.linux-arm64.tar.gz"

if ! command -v go &> /dev/null; then
    sudo apt update && sudo apt install -y wget git build-essential

    wget $GO_URL
    tar -xvf go$GO_VERSION.linux-arm64.tar.gz
    sudo mv go /usr/local

    echo 'export GOPATH=$HOME/go' >> ~/.profile
    echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.profile
    source ~/.profile

    # Cleanup
    rm go$GO_VERSION.linux-arm64.tar.gz

    # Check Go version
    installed_version=$(go version | awk '{print $3}' | sed 's/go//')
    if [ "$installed_version" = "$GO_VERSION" ]; then
        echo "Go $GO_VERSION installed successfully."
    else
        echo "Failed to install Go $GO_VERSION. Installed version: $installed_version"
        exit 1
    fi
else
    echo "$(go version) is already installed. Exiting."
    exit 0
fi
