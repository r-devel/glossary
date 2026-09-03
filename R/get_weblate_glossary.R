#' Get the Weblate glossary
#'
#' Downloads and standardises the Weblate glossary for use in the
#' combined glossary.
#'
#' @param url URL of the Weblate glossary CSV file.
#' @param retrieved_at Date on which the glossary is retrieved.
#'
#' @return A data frame containing the standardised Weblate glossary.
#'
#' @export
get_weblate_glossary <- function(
  url = paste0(
    "https://translate.rx.studio/download/",
    "r-project/glossary/en/?format=csv"
  ),
  retrieved_at = Sys.Date()
  ) {
    readr::read_csv(
      url,
      show_col_types = FALSE
    ) |>
      janitor::clean_names() |>
      dplyr::mutate(
        english = .data$source,
        spanish = .data$target,
        synonym = NA_character_,
        observation = dplyr::coalesce(
          .data$translator_comments,
          .data$developer_comments
        ),
        source = "Weblate",
        source_url = url,
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
}
