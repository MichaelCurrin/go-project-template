# Deploy


## Build

Compile the app as a single binary in the unversioned `build` directory.

```sh
$ make build
```

Run the build:

```sh
$ build/myapp -h
```

You can share that binary with others to download and run.

For example, add the binary to a GitHub release as an asset and add Download button in your docs. That will make it easy for someone to download from GitHub. TH

Note that the binary is specific to an OS architecture.


## Install globally

It can be useful to install the app globally and then use it a bit before releasing it.

See the [Install globally](install-globally.md) doc.


## CI flow

This project used GitHub Actions for CI.

See the [workflow](/.github/workflows/main.yml). This builds the app on pushes.

Nothing is persisted. For info on using CI to build and release your assets, see this [guide](https://michaelcurrin.github.io/code-cookbook/recipes/ci-cd/github-actions/workflows/go/).


## Release steps

1. **Push** any unpushed changes.
1. Check that the GH Actions **workflow** was successful. See [CI flow](#ci-flow) below.
1. Locally:
    1. **Increment** the version number in [main.go](/main.go).
    1. **Commit** as "Bump version number".
    1. **Tag** the commit.
    1. **Build** a binary file (this will include the version number in its help output). See [Build](#build) section below.
    1. **Zip** the file
    1. **Rename** the zip file. e.g. for macOS: `go_project_template_0.4.0_darwin.tar.gz`.
    1. **Test** the file.
    1. **Push** the commits. and the tag.
1. Create a **Release** on GitHub.
1.  **Upload** the binary file on asset.

The [Go Releaser](https://goreleaser.com/ci/actions/) action can help with automating this flow.
