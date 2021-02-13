# Deploy


## Build

Compile to app as a single binary.

```sh
$ make build
```

This also installs the app to your `GOBIN`, if you want to run that locally.

The output file can be found here:

- `build/myapp`

This can be downloaded by others using the same OS architecture as what you compiled with.

You can add the binary to a GitHub release as an asset to make it easy for someone to download.


## CI

This project used GitHub Actions for CI.

See the [workflow](/.github/workflows/main.yml). This builds the app on pushes.

Nothing is persisted. For info on using CI to build and release your assets, see this [guide](https://michaelcurrin.github.io/code-cookbook/recipes/ci-cd/github-actions/workflows/go/).
