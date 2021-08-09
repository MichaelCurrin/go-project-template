
# Install globally

Compile the app and install to your `GOBIN` as `go-project-template`.

_This will not add to the project `build` directory._

```sh
$ make global
```

```sh
$ cd ~
$ go-project-template -h
```

Make sure your `PATH` is setup in `~/.bashrc` or similar to include the `GOBIN` directory, so your command can be run from anywhere:

```sh
export PATH="$PATH:$GOPATH/bin"
```
