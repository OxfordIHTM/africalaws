
<!-- README.md is generated from README.Rmd. Please edit that file -->

# africalaws: Interface to the Laws.Africa API <img src="man/figures/logo.png" width="200" align="right" />

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/OxfordIHTM/africalaws/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/OxfordIHTM/africalaws/actions/workflows/R-CMD-check.yaml)
[![test-coverage](https://github.com/OxfordIHTM/africalaws/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/OxfordIHTM/africalaws/actions/workflows/test-coverage.yaml)
[![codecov](https://codecov.io/gh/OxfordIHTM/africalaws/graph/badge.svg?token=NfjEc8Xi2y)](https://codecov.io/gh/OxfordIHTM/africalaws)
[![CodeFactor](https://www.codefactor.io/repository/github/oxfordihtm/africalaws/badge)](https://www.codefactor.io/repository/github/oxfordihtm/africalaws)
<!-- badges: end -->

[Laws.Africa](https://laws.africa) endeavours to facilitate African
governments in offering sustainable, free access to dependable digital
laws. It aims to achieve this by ensuring that the laws are easily
accessible, user-friendly, educational, and reusable. This initiative
seeks to empower citizens with knowledge of their legal rights and
obligations while promoting transparency and accountability within the
legal system. Laws.Africa offers a content application programming
interface (API) to fetch legislative content and metadata. The API is a
read-only API for listing and fetching published versions of legislative
works. This package interfaces with this API to allow access using R.

## What does `africalaws` do?

Please note that `africalaws` is still highly experimental and is
undergoing a lot of development. Hence, any functionalities described
below and in the rest of the package documentation have a high
likelihood of changing interface or approach as we aim for a stable
working version.

Currently, the package provides functions for:

  - Authenticating with the Laws.Africa API;
  - Performing a call to the `countries` API endpoint; and,
  - Performing a call to the `works` API endpoint.

From here, the plan is to continue developing functions that wrap the
various available [API
endpoints](https://developers.laws.africa/api/about-the-api).

## Installation

`africalaws` is not yet on CRAN but can be installed from the [Oxford
iHealth R Universe](https://oxfordihtm.r-universe.dev) as follows:

``` r
install.packages(
  "africalaws",
  repos = c('https://oxfordihtm.r-universe.dev', 'https://cloud.r-project.org')
)
```

## Usage

The following vignettes describe how to use the `africalaws` package.

  - Authenticating with the Laws.Africa API

  - Listing out countries and areas/locations with available works from
    the Laws.Africa API

  - Listing out works for a specific country or areas/locations that are
    available from the Laws.Africa API

## Citation

If you find the `africalaws` package useful please cite using the
suggested citation provided by a call to the `citation()` function as
follows:

``` r
citation("africalaws")
#> To cite africalaws in publications use:
#> 
#>   Jillian Francise Lee, Ernest Guevarra (2024). _africalaws:
#>   Interface to the Laws.Africa API_. R package version 0.0.9000,
#>   <https://oxford-ihtm.io/africalaws/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {africalaws: Interface to the Laws.Africa API},
#>     author = {{Jillian Francise Lee} and {Ernest Guevarra}},
#>     year = {2024},
#>     note = {R package version 0.0.9000},
#>     url = {https://oxford-ihtm.io/africalaws/},
#>   }
```

## Community guidelines

Feedback, bug reports and feature requests are welcome; file issues or
seek support [here](https://github.com/OxfordIHTM/africalaws/issues). If
you would like to contribute to the package, please see our
[contributing
guidelines](https://oxford-ihtm.io/africalaws/CONTRIBUTING.html).

This project is released with a [Contributor Code of
Conduct](https://oxford-ihtm.io/africalaws/CODE_OF_CONDUCT.html). By
participating in this project you agree to abide by its terms.
