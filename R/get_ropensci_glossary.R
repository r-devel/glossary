#' Get the rOpenSci glossary
#'
#' Downloads and standardises the rOpenSci glossary for use in the
#' combined glossary.
#'
#' @param url URL of the rOpenSci glossary CSV file.
#' @param retrieved_at Date on which the glossary is retrieved.
#'
#' @return A data frame containing the standardised rOpenSci glossary.
#'
#' @export
get_ropensci_glossary <- function(
    url = paste0(
      "https://raw.githubusercontent.com/",
      "ropensci-review-tools/glossary/master/glossary.csv"
    ),
    retrieved_at = Sys.Date()
  ) {
  
  glossary_columns <- c(
    "english",
    "spanish",
    "synonym",
    "observation",
    "source",
    "source_url",
    "retrieved_at",
    "added_via",
    "updated_via",
    "weblate",
    "location",
    "id",
    "fuzzy",
    "context",
    "translator_comments",
    "developer_comments"
  )

  readr::read_csv(
    url,
    show_col_types = FALSE
  ) |>
    janitor::clean_names() |>
    dplyr::mutate(
      source = "rOpenSci",
      source_url = url,
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
      dplyr::all_of(glossary_columns)
    )
}
