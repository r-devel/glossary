#' Combine glossary sources
#'
#' Combines the rOpenSci and Weblate glossaries into a single,
#' standardised glossary data frame.
#'
#' @param ropensci_glossary A standardised rOpenSci glossary data frame.
#' @param weblate_glossary A standardised Weblate glossary data frame.
#'
#' @return A combined glossary data frame.
#'
#' @export
combine_glossaries <- function(
    ropensci_glossary,
    weblate_glossary
  ) {

  character_columns <- c(
    "english",
    "spanish",
    "synonym",
    "observation",
    "source",
    "source_url",
    "added_via",
    "updated_via",
    "weblate",
    "location",
    "id",
    "context",
    "translator_comments",
    "developer_comments"
  )

  dplyr::bind_rows(
    ropensci_glossary,
    weblate_glossary
  ) |>
    dplyr::mutate(
      dplyr::across(
        dplyr::all_of(character_columns),
        as.character
      ),
      fuzzy = as.logical(.data$fuzzy)
    ) |>
    dplyr::distinct()
}
