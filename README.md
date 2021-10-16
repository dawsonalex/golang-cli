# golang-cli
A template for CLI applications in Golang.

## Why?

Often I have the idea to create a new small CLI application in Go. I want that application to have the same niceties
that other applications have, in terms of CI and automatic releases but often the cost set up outweighs the payoff.

This template not only provides a starting structure for CLI applications, but also a basic GitHub Action that will
manage build, testing, and releases automatically based on commit message.

## Usage

If you want to use this template for a Go module, run:

```shell
go mod init
```

You can then use the `Makefile` to run common commands. To see available commands, run `make help`.
