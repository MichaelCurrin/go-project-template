# Quickstart

How to setup a new project. This demonstrates how to install modules and run scripts, rather than a good structure for large projects.

Instructions followed:

- https://golang.org/doc/tutorial/getting-started

Package used:

- https://pkg.go.dev/rsc.io/quote

### Hello world steps

Create `hello.go` with an import of `quote`.

Initialize a module.

```sh
$ go mod init hello
```

That generates [go.mod](/go.mod).

Initial content:

```go
module hello

go 1.15
```

Install packages and run module.

```sh
$ go run hello.go
```

The `go.mod` now has an extra line.

```go
module hello

go 1.15

require rsc.io/quote v1.5.2
```

That generates [go.sum](/go.sum), which is used to check downloaded versions and checksums are what is expected.

This file should be versioned according to the [Wiki](https://github.com/golang/go/wiki/Modules#releasing-modules-all-versions):

> Ensure your go.sum file is committed along with your go.mod file.

If you open the `go.sum` file, you'll find the installed `quote` modules relies on this package:

- `golang.org/x/text`

That URL redirects to:

- https://pkg.go.dev/golang.org/x/text

For help on modules see

```sh
$ go help modules
```

Blog post

https://blog.golang.org/using-go-modules


For comparison, see the [go.mod](https://github.com/rsc/quote/blob/v1.5.2/go.mod) file of `quote`:

```go
module "rsc.io/quote"

require "rsc.io/sampler" v1.3.0
```


## Create and call a package

### Create a module

```sh
$ mkdir greetings
$ cd greetings
```

```sh
$ go mod init example.com/greetings
```

Create a script - [greetings.go](/greetings/go.mod).

### Call it

From the project root.

```sh
$ mkdir hello
$ cd hello
```

Create a file [hello](/hello/hello.go).

Create a new module.

```sh
$ go mod init hello
```

For production use, you'd publish `greetings` to a server.

And you'd reference the published module like this:

```go
require example.com/greetings v1.1.0
```

For now, we adapt the caller's module so it can find the greetings code on your local file system.

```go
replace example.com/greetings => ../greetings
```

Locate the module and add it to a `go.mod` file.

```sh
$ go build
go: found example.com/greetings in example.com/greetings v0.0.0-00010101000000-000000000000
```

That adds this line to `go.mod`:

```go
require example.com/greetings v0.0.0-00010101000000-000000000000
```

Run the executable created by the build command.

```sh
$ ./hello
```
