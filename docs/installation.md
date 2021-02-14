# Installation
> Instructions for setting up a local dev environment


## Requirements

| Name     | Description                                                                                                                                    |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| [Go][]   | "Go is an open source programming language that makes it easy to build simple, reliable, and efficient software."                              |
| [Make][] | Standard on Linux and macOS. A task runner that is used throughout this project. Run commands in [Makefile](/Makefile) directly if you prefer. |

[Go]: https://golang.org
[Make]: https://www.gnu.org/software/make/


## Clone

```sh
$ git clone git@github.com:MichaelCurrin/go-project-template.git
$ cd go-project-template
```


## Install system dependencies

Install Go on your system - see [Install Go](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/go/install-go.html) instructions.


## Install project packages

This step is _optional_ as packages will be installed on an initial run.

```sh
$ make install
```

If you need to upgrade all packages to the latest:

```sh
$ make upgrade
```
