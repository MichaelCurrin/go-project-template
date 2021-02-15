# Deploy


## Release steps

1. **Push** any unpushed changes.
2. Check that the GH Actions **workflow** was successful. See [CI flow](#ci-flow) below.
3. Locally:
    1. **Increment** the version number in [main.go](/main.go).
    2. **Commit** as "Bump version number".
    3. **Tag** the commit.
    4. **Build** a binary file (this will include the version number in its help output). See [Build](#build) section below.
    5. **Zip** the file
    6. **Rename** the zip file. e.g. for macOS: `go_project_template_0.4.0_darwin.tar.gz`.
    7. **Test** the file.
    8. **Push** the commits. and the tag.
4. Create a **Release** on GitHub.
5.  **Upload** the binary file on asset.

The [Go Releaser](https://goreleaser.com/ci/actions/) action can help with automating this flow.

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

Compile the app and install to your `GOBIN`. This will not add to the project `build` directory.

```sh
$ make global
```

Test it:

```sh
$ cd ~
$ go-project-template -h
```

Make sure your `PATH` is setup in `~/.bashrc` or similar to include the `GOBIN` directory, so your command can be run from anywhere:

```sh
export PATH="$PATH:$GOPATH/bin"
```


## CI flow

This project used GitHub Actions for CI.

See the [workflow](/.github/workflows/main.yml). This builds the app on pushes.

Nothing is persisted. For info on using CI to build and release your assets, see this [guide](https://michaelcurrin.github.io/code-cookbook/recipes/ci-cd/github-actions/workflows/go/).
