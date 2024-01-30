#!/bin/bash
set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 <go_version>"
    echo "See https://go.dev/dl/ for available versions"
    exit 1
fi

GO_VERSION=$1
GO_GZ="go$GO_VERSION.linux-arm64.tar.gz"
GO_URL="https://go.dev/dl/$GO_GZ"

if ! command -v go &> /dev/null; then
    sudo apt update && sudo apt install -y git build-essential

    curl -4 -L -o $GO_GZ $GO_URL
    tar -xvf $GO_GZ
    sudo mv go /usr/local

    echo 'export GOPATH=$HOME/go' >> ~/.profile
    echo 'export PATH=/usr/local/go/bin:$GOPATH/bin:$PATH' >> ~/.profile

    # Apply changes to the current shell session
    export GOPATH=$HOME/go
    export PATH=/usr/local/go/bin:$GOPATH/bin:$PATH

    # Cleanup
    rm $GO_GZ

    # Check Go version
    if go version &> /dev/null; then
        installed_version=$(go version | awk '{print $3}' | sed 's/go//')
        if [ "$installed_version" = "$GO_VERSION" ]; then
            echo "Go $GO_VERSION installed successfully."
        else
            echo "Failed to install Go $GO_VERSION. Installed version: $installed_version"
            exit 1
        fi
    else
        echo "Failed to verify Go installation. Please check manually."
        exit 1
    fi
else
    echo "$(go version) is already installed. Exiting."
    exit 0
fi
