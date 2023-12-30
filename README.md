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
