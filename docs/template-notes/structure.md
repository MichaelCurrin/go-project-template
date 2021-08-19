# Structure
> An explanation of this project's file and directory structure

For smaller projects, you may find it much simpler and easier to have Go modules in the top-level of your repo, as covered in the basic section.


## Basic structure

I don't know if you can have multiple modules as files at the top-level because of limitations on relative imports - but modules can be used externally. Or put the modules into directories using `pkg` or `internal` or custom names.

### Main

- [main.go](https://github.com/MichaelCurrin/go-project-template/blob/main/main.go)

Entry-point script. This handles argument parsing and then runs the [Greetings](#greetings) module.

### Greetings

- [internal/greetings.go](https://github.com/MichaelCurrin/go-project-template/blob/main/internal/greetings.go)

This is imported and used in `main.go`.

It must have `package greetings` at the top and not `package main` so it can be imported.

The filename can be anything, it seems.

### Go module

The project's packages.

- [go.mod](https://github.com/MichaelCurrin/go-project-template/blob/main/go.mod)

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

Or, a more verbose way.

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

For small projects, you can choose to have a flat structure with everything in the root of the repo.

See the official [Project Layout](https://github.com/golang-standards/project-layout#go-directories) repo's docs for more info.

| Path         | Description                                                                                                                                                                                                                                                           |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [cmd][]      | Public - entry-point for the CLI. Keep this light on code. Inside `cmd`, include a directory named as the intended name of your executable and add `main.go` file there. |
| [internal][] | Private - application and library code, disallowed for use in other projects. Note that this layout pattern is enforced by the Go compiler itself.                                                                       |
| [pkg][]      | Public - library code that's fine to use by external applications.                                                                                                                                                                                                                |

Not used in this project, but recommended if needed:

Path | Description 
--- | ---
[web][] | For if your project is a web app.
[scripts][] | Shell scripts. Or `bin` based on outside Go.


[internal]: https://github.com/MichaelCurrin/go-project-template/tree/main/internal/
[cmd]: https://github.com/MichaelCurrin/go-project-template/tree/main/cmd/
[pkg]: https://github.com/MichaelCurrin/go-project-template/tree/main/pkg/

[web]: https://github.com/golang-standards/project-layout/tree/master/web
[scripts]: https://github.com/golang-standards/project-layout/tree/master/scripts

A sample `cmd` script in another repo, as recommended by the layouts project.

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
- [pkg/app/sensor/app.go](https://github.com/docker-slim/docker-slim/blob/master/pkg/app/sensor/app.go)
    - That is set up as `package app`. 
    - It has a `Run` function. So that is how `app.Run()` is called.
    - Not to be confused with setting up a CLI app like this with the `cli` package:
        ```go
        app := &cli.App{}
        app.Run(os.Args)
        ```

That project has `pkg/app` and `pkg/master` as divisions but I don't know why.

Here is a CLI there.

- [pkg/app/master/cli.go](https://github.com/docker-slim/docker-slim/blob/master/pkg/app/master/cli.go)
- [pkg/app/master/commands/run/cli.go](https://github.com/docker-slim/docker-slim/blob/master/pkg/app/master/commands/run/cli.go) and other cli.go files in `commands/*/`.
