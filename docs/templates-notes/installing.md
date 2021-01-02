# Installing

Notes

Reference for [get](https://golang.org/pkg/cmd/go/internal/get/) command.

The `-v` flag enables verbose progress and debug output.

```sh
$ go get -v github.com/go-delve/delve/cmd/dlv
$ go get -v github.com/godoctor/godoctor
```

From the CLI help:

> With no package arguments, 'go get' applies to Go package in the
current directory, if any.
>
> In particular, 'go get -u' and 'go get -u=patch' update all the dependencies of that package.
>
> With no package arguments and also without -u, 'go get' is not much more than 'go install', and 'go get -d' not much more than 'go list'.
