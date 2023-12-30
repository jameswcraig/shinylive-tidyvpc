# shinylive-tidyvpc

Example `shinylive` app for VPC using the `tidyvpc` package. 

## Usage

1.) Make Shiny app e.g., see example in `vpc/app.R`

2.) Create assets for `shinylive`:

```r
shinylive::export(appdir = "vpc", destdir = "docs")
```

3.) Serve the app locally:

```r
httpuv::runStaticServer("docs", port = 8888)
```

## Issues

Matrix >= 1.6-5 is required by `tidyvpc`. There currently appears to be an [issue](https://github.com/r-universe/r-forge/actions/runs/7343545542/job/20020102993) building this version of the `Matrix` package for WASM.
