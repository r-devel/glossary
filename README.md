
<!-- README.md is generated from README.Rmd. Please edit that file -->

# glossary

<!-- badges: start -->

[![R-CMD-check](https://github.com/r-devel/glossary/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/r-devel/glossary/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of this package is to manage a glossary for R translation
projects. The idea is based on [a
proposal](https://github.com/SaranjeetKaur/isc_proposal_translations)
created by [Saranjeet Kaur Bhogal
(@SaranjeetKaur)](https://github.com/SaranjeetKaur/). The project was
launched during the [R Dev Day @ RSE
Con25](https://warwick.ac.uk/fac/sci/statistics/news/r-dev-day-rsecon25).
This is repo is currently Work in Progress.

## Installation

You can install the development version of glossary from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("r-devel/glossary")
```

## With `Write` permissions:

Steps to add pre-commit:

1.  Do the following in the Terminal application of your machine. Do not
    do this in RStudio Terminal:
    1.  For windows `pip3 install pre-commit --user`
    2.  For mac `brew install pre-commit`
2.  Clone the repo <https://github.com/r-devel/glossary> to a local
    folder.  
3.  Go to RStudio Console and type

``` r
install.packages("devtools")
```

    ## Installing package into '/private/var/folders/7k/kpyh33yd4mlbp_p2j8m4810m0000gn/T/Rtmp8NpaOv/temp_libpath11ffa4c8e05e2'
    ## (as 'lib' is unspecified)

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/7k/kpyh33yd4mlbp_p2j8m4810m0000gn/T//Rtmpvoicpp/downloaded_packages

``` r
install.packages("precommit")
```

    ## Installing package into '/private/var/folders/7k/kpyh33yd4mlbp_p2j8m4810m0000gn/T/Rtmp8NpaOv/temp_libpath11ffa4c8e05e2'
    ## (as 'lib' is unspecified)

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/7k/kpyh33yd4mlbp_p2j8m4810m0000gn/T//Rtmpvoicpp/downloaded_packages

``` r
precommit::use_precommit()
```

    ## ℹ Using local config from /private/var/folders/7k/kpyh33yd4mlbp_p2j8m4810m0000gn/T/Rtmp8NpaOv/temp_libpath11ffa4c8e05e2/precommit/pre-commit-config-pkg.yaml.

    ## ℹ There is already a pre-commit configuration file in /Users/jyotibhogal/Documents/GitHub/glossary. Use `force = TRUE` to replace .pre-commit-config.yaml.

    ## • Edit .precommit-config.yaml to (de)activate the hooks you want to use.

    ## • All available hooks: https://pre-commit.com/hooks.html

    ## • R specific hooks: https://github.com/lorenzwalthert/precommit

    ## ✔ Ran `pre-commit autoupdate ()` to get the latest version of the hooks.

    ## ℹ Installing hooks in non-blocking background process. If you experience problems or prefer a blocking process, use `options("precommit.block_install_hooks" = TRUE)`.

    ## • Sign in with GitHub to authenticate <https://pre-commit.ci> and then come
    ## back to complete the set-up process.

    ## • It seems like you are using the roxygenize hook. This requires further edits
    ## in your `.pre-commit-config.yaml`, please run
    ## `precommit::snippet_generate('additional-deps-roxygenize')` to proceed.

This will open pre-commit interface in browser. Sign into it with
GitHub.

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(glossary)
## basic example code
```

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->

<!-- prettier-ignore-start -->

<!-- markdownlint-disable -->

All contributions to this project are gratefully acknowledged using the
[`allcontributors` package](https://github.com/ropensci/allcontributors)
following the [all-contributors](https://allcontributors.org)
specification. Contributions of any kind are welcome!

<table>

<tr>

<td align="center">

<a href="https://github.com/SaranjeetKaur">
<img src="https://avatars.githubusercontent.com/u/28556616?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/r-devel/glossary/commits?author=SaranjeetKaur">SaranjeetKaur</a>
</td>

<td align="center">

<a href="https://github.com/rivaquiroga">
<img src="https://avatars.githubusercontent.com/u/31421616?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/r-devel/glossary/commits?author=rivaquiroga">rivaquiroga</a>
</td>

</tr>

</table>

<!-- markdownlint-enable -->

<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
