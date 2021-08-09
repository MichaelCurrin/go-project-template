# Installation
> Instructions for setting up a local dev environment


## Requirements

| Name     | Description                                                                                                       |
| -------- | ----------------------------------------------------------------------------------------------------------------- |
| [Go][]   | "Go is an open source programming language that makes it easy to build simple, reliable, and efficient software." |
| [Make][] | Standard on Linux and macOS. A task runner that is used throughout this project. Runs commands in the `Makefile`  |

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

This step is actually _optional_ as packages will be installed on an initial run.

```sh
$ make install
```


## Maintain packages

### Upgrade

Upgrade all packages to the latest:

```sh
$ make upgrade
```

### Tidy

Install missing modules and removed unused modules from the lockfile.

```sh
$ make tidy
```
