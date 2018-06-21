# shinyflags

Easily include country flags in your Shiny application.

## Installation

shinyflags is not on CRAN yet, you can install it with devtools

``` r
devtools::install_github("tutuchan/shinyflags")
```

## Usage

``` r
# create the HTML code
flag("FR")

# list all flags
flags_list()
```

You can run the example demo with:

``` r
shiny::runApp(system.file("example.R", package = "shinyflags"))
```

## Acknowledgments

Flags SVG come from the [flag-icon-css](https://github.com/lipis/flag-icon-css) collection distributed by Panayiotis Lipiridis, many thanks to him.

