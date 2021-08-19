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

Run the app through `make`, using fixed sample inputs. This is useful for development.

```console
$ make run
go run main.go
Hello, World!
go run main.go --name Gopher
Hello, Gopher!
```

Or install it globally, as per [Quickstart](quickstart.md) or [Installation](installation.md) and then run it anywhere by name.

```console
$ go-project-template
Hello, World!
```

See [Deploy](deploy.md) for building the app.
