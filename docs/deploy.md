# Deploy


## Build

Compile the app as a single binary in the unversioned `build` directory.

```sh
$ make build
```

Test the build:

```sh
$ build/myapp -h
```

You can share that binary with others to download and run.

For example, add the binary to a GitHub release as an asset and add Download button in your docs. That will make it easy for someone to download from GitHub. TH

Note that the binary is specific to an OS architecture.


## Install globally

Install to your `GOBIN`.

```sh
$ make global
```

Test it:

```sh
$ go-project-template -h
```

Make sure your `PATH` is setup in `.bashrc` or similar to include the `GOBIN` directory, so your command can be run from anywhere:

```sh
export PATH="$PATH:$GOPATH/bin"
```

## CI flow

This project used GitHub Actions for CI.

See the [workflow](/.github/workflows/main.yml). This builds the app on pushes.

Nothing is persisted. For info on using CI to build and release your assets, see this [guide](https://michaelcurrin.github.io/code-cookbook/recipes/ci-cd/github-actions/workflows/go/).
