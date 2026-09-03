# Get the Weblate glossary

Downloads and standardises the Weblate glossary for use in the combined
glossary.

## Usage

``` r
get_weblate_glossary(
  url = paste0("https://translate.rx.studio/download/",
    "r-project/glossary/en/?format=csv"),
  retrieved_at = Sys.Date()
)
```

## Arguments

- url:

  URL of the Weblate glossary CSV file.

- retrieved_at:

  Date on which the glossary is retrieved.

## Value

A data frame containing the standardised Weblate glossary.
