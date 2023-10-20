# pigo

Go installation and removal scripts for Raspberry Pi ARM64

## goget.sh

goget.sh is a Bash script designed to simplify the process of installing Go on a Raspberry Pi (64-bit) system. It automatically downloads the specified Go version, configures the environment variables, and sets up the Go workspace.

Usage

```
chmod +x goget.sh
./goget.sh <go_version>
```

Replace `<go_version>` with the desired Go version number (e.g. `1.21.3`).

The script will download and install the specified Go version and set up the necessary environment variables. e.g.

```
./goget.sh 1.21.3
```

## gone.sh

gone.sh is a companion script that allows you to remove Go from your system. It cleans up the installed Go files and removes the related environment variables.

Usage

```
chmod +x gone.sh
./gone.sh
```

`goget.sh` and `gone.sh` require set executable permissions before running them:


## Additional Information

[Go Official Website](https://go.dev/) - Information about the Go programming language, documentation, and resources.

[Go Downloads](https://go.dev/) - Downloads page to find available Go versions.
