# cmd Directory

This directory is for main entry points for CLI commands. If you only have one, you could change the content of
`main.go`. If your project has multiple commands, separate each one out by adding a sub-directory under this one
with the name of the command. E.g:

```shell
cmd/my-command/main.go
cmd/my-second-command/main.go
```
