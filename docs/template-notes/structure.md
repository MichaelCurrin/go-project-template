# Structure

This doc explains the structure of this project.

For smaller projects, you may find it, you may find it much simpler and easier to have Go modules in the top-level of your repo, as covered in the basic section.

## Basic structure

I don't know if you can have multiple modules as files at the top-level because of limitations on relative imports - but modules can be used externally. Or put the modules into directories using `pkg` or `internal` or custom names.

### Main

[main.go](/main.go)

Entry-point script and argument parsing.

### Greetings

[internal/greetings.go](/internal/greetings.go)

This is imported in `main.go`.

It must have `package greetings` at the top and not `package main` so it can be imported.

The filename can be anything it seems.

### Go module

`go.mod`

Go does not have relative imports, by design.

Given a `go.mod` setup like this:

```go
module github.com/MichaelCurrin/go-project-template
```

Say that you want to import your local code from `internal/greetings.go`.

Note: I've tried importing from `./greetings.go` at the top-level using approaches below, but I can't get it to work.

### Easy

You can import like this.

```go
import (
	greetings "github.com/MichaelCurrin/go-project-template/internal"
)
```

That will pick up `package greetings` in `internal/greetings.go`.

And then you can use as `greetings.Hello` as a call to `Hello` in the package.

Test with:

```sh
$ go build
```

### Verbose

Or a more verbose way.

You would import like this:

```go
import (
    github.com/MichaelCurrin/go-project-template/internal
)
```

The directory name can be `greetings` instead of `internal`, just ensure the import statement and directory name match.

If you have local unpushed code you want to use, you probably want to _skip_ a URL request to GitHub.

So set this up in `go.mod`:

```go
replace github.com/MichaelCurrin/go-project-template => ./
```

Or this. But then you would need more lines for more imports.

```go
replace github.com/MichaelCurrin/go-project-template/internal => ./internal
```


## Full structure

See the official [Project Layout](https://github.com/golang-standards/project-layout#go-directories) repo's docs for more info.

| Path                  | Description                                                                                                                                                                                                                                                           |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [cmd](/cmd/)          | Entry-point for the CLI. Keep this light on code. Inside `cmd`, include a directory named as the intended name of your executable and add `main.go` file there. This approach is not used for this project, to keep things easier to learn and read as a Go beginner. |
| [internal](/internal) | Private application and library code. This is the code you don't want others importing in their applications or libraries. Note that this layout pattern is enforced by the Go compiler itself.                                                                       |
| [pkg](/pkg/)          | Library code that's ok to use by external applications                                                                                                                                                                                                                |

Sample `cmd` script in a repo recommended by the layouts project.

- [cmd/docker-slim-sensor/main.go](https://github.com/docker-slim/docker-slim/blob/master/cmd/docker-slim-sensor/main.go)
    ```go
    package main

    import (
        "github.com/docker-slim/docker-slim/internal/app/sensor"
    )

    func main() {
        app.Run()
    }
    ```

See [internal/app/sensor/app.go](https://github.com/docker-slim/docker-slim/blob/master/internal/app/sensor/app.go)

That is setup as `package app`.

It has a `Run` function.

So that is how `app.Run()` is called.

Not to be confused with setting up a CLI as:

```go
app := &cli.App{}
app.Run(os.Args)
```
