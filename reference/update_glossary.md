# Update a glossary entry

Adds a new glossary entry or updates an existing entry in a glossary
data frame.

## Usage

``` r
update_glossary(
  glossary,
  english,
  spanish,
  synonym = NA_character_,
  observation = NA_character_,
  updated_via = c("GitHub", "Weblate"),
  weblate = NA_character_
)
```

## Arguments

- glossary:

  A glossary data frame.

- english:

  A character string containing the English term.

- spanish:

  A character string containing the Spanish translation.

- synonym:

  An optional character string containing a synonym.

- observation:

  An optional character string containing additional observations.

- updated_via:

  Where the entry was updated. Either `"GitHub"` or `"Weblate"`.

- weblate:

  Whether the entry should be included in Weblate. One of `"include"`,
  `"exclude"`, or `NA`.

## Value

An updated glossary data frame.

## Details

Existing entries are identified using the English term. New entries are
added to the glossary.

## Examples

``` r
updated_glossary <- update_glossary(
  glossary = glossary,
  english = "data frame",
  spanish = "marco de datos",
  updated_via = "GitHub",
  weblate = "include"
)
#> Error: object 'glossary' not found
```
