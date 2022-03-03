# Usage


## Format

```sh
$ make fmt-check
```

```sh
$ make fmt-fix
```

## Lint

```sh
$ make lint
```

Note that `staticcheck` is installed as a global dependency to avoid it appearing unused in `go.mod` and therefore getting auto-removed on tidy.


## Unit tests

```sh
$ make test
```


## View the app usage

```console
$ make usage
go run main.go -h
NAME:
   My App - Display a friendly greeting

...
```


## Run

### With Go

```console
$ go run main.go
Hello, World!
```

```console
$ go run main.go --name Gopher
Hello, Gopher!
```

### With make

Run the app through `make` (on Linux and macOS), using some fixed sample inputs. This is useful for development to check functionality on a few test cases.

```console
$ make run
go run main.go
Hello, World!
go run main.go --name Gopher
Hello, Gopher!
```

### With binary

Install the app globally, as per [Quickstart](quickstart.md) or [Installation](installation.md).

Then run it anywhere by name:

```console
$ go-project-template
Hello, World!
```

See [Deploy](deploy.md) for building the app for a release.
