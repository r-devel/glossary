# data-raw/combine_glossaries.R

# ---------------------------------------------------------
# URLs
# ---------------------------------------------------------

ropensci_url <- paste0(
  "https://raw.githubusercontent.com/",
  "ropensci-review-tools/glossary/master/glossary.csv"
)

weblate_url <- paste0(
  "https://translate.rx.studio/download/",
  "r-project/glossary/en/?format=csv"
)

# ---------------------------------------------------------
# Retrieval date
# ---------------------------------------------------------

retrieved_at <- Sys.Date()

# ---------------------------------------------------------
# rOpenSci glossary
# ---------------------------------------------------------

ropensci <- readr::read_csv(
  ropensci_url,
  show_col_types = FALSE
) |>
  janitor::clean_names() |>
  dplyr::mutate(
    source = "rOpenSci",
    source_url = ropensci_url,
    retrieved_at = retrieved_at,
    added_via = "GitHub",
    updated_via = "GitHub",
    weblate = NA_character_,
    location = NA_character_,
    id = NA_character_,
    fuzzy = NA,
    context = NA_character_,
    translator_comments = NA_character_,
    developer_comments = NA_character_
  ) |>
  dplyr::select(
    english,
    spanish,
    synonym,
    observation,
    source,
    source_url,
    retrieved_at,
    added_via,
    updated_via,
    weblate,
    location,
    id,
    fuzzy,
    context,
    translator_comments,
    developer_comments
  )

# ---------------------------------------------------------
# Weblate glossary
# ---------------------------------------------------------

weblate <- readr::read_csv(
  weblate_url,
  show_col_types = FALSE
) |>
  janitor::clean_names() |>
  dplyr::mutate(
    english = source,
    spanish = target,

    synonym = NA_character_,

    observation = dplyr::coalesce(
      translator_comments,
      developer_comments
    ),

    source = "Weblate",
    source_url = weblate_url,
    retrieved_at = retrieved_at,
    added_via = "Weblate",
    updated_via = "Weblate",
    weblate = "include"
  ) |>
  dplyr::select(
    english,
    spanish,
    synonym,
    observation,
    source,
    source_url,
    retrieved_at,
    added_via,
    updated_via,
    weblate,
    location,
    id,
    fuzzy,
    context,
    translator_comments,
    developer_comments
  )

# ---------------------------------------------------------
# Combine glossaries
# ---------------------------------------------------------

combine <- dplyr::bind_rows(
  ropensci,
  weblate
) |>
  dplyr::mutate(
    dplyr::across(
      c(
        english,
        spanish,
        synonym,
        observation,
        source,
        source_url,
        added_via,
        updated_via,
        weblate,
        location,
        id,
        context,
        translator_comments,
        developer_comments
      ),
      as.character
    ),
    fuzzy = as.logical(fuzzy)
  ) |>
  dplyr::distinct()


# ---------------------------------------------------------
# Save as package data
# ---------------------------------------------------------

usethis::use_data(
  combine,
  overwrite = TRUE
)
