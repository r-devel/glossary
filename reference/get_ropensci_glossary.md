# Get the rOpenSci glossary

Downloads and standardises the rOpenSci glossary for use in the combined
glossary.

## Usage

``` r
get_ropensci_glossary(
  url = paste0("https://raw.githubusercontent.com/",
    "ropensci-review-tools/glossary/master/glossary.csv"),
  retrieved_at = Sys.Date()
)
```

## Arguments

- url:

  URL of the rOpenSci glossary CSV file.

- retrieved_at:

  Date on which the glossary is retrieved.

## Value

A data frame containing the standardised rOpenSci glossary.
