#' Update a glossary entry
#'
#' Adds a new glossary entry or updates an existing entry in a glossary
#' data frame.
#'
#' Existing entries are identified using the English term. New entries
#' are added to the glossary.
#'
#' @param glossary A glossary data frame.
#' @param english A character string containing the English term.
#' @param spanish A character string containing the Spanish translation.
#' @param synonym An optional character string containing a synonym.
#' @param observation An optional character string containing additional
#'   observations.
#' @param updated_via Where the entry was updated. Either `"GitHub"` or
#'   `"Weblate"`.
#' @param weblate Whether the entry should be included in Weblate. One of
#'   `"include"`, `"exclude"`, or `NA`.
#'
#' @return An updated glossary data frame.
#'
#' @examples
#' updated_glossary <- update_glossary(
#'   glossary = glossary,
#'   english = "data frame",
#'   spanish = "marco de datos",
#'   updated_via = "GitHub",
#'   weblate = "include"
#' )
#'
#' @export
update_glossary <- function(
  glossary,
  english,
  spanish,
  synonym = NA_character_,
  observation = NA_character_,
  updated_via = c("GitHub", "Weblate"),
  weblate = NA_character_
) {

  # Validate glossary
  if (!is.data.frame(glossary)) {
    stop(
      "`glossary` must be a data frame.",
      call. = FALSE
    )
  }

  # Validate English term
  if (!is.character(english) || length(english) != 1L) {
    stop(
      "`english` must be a single character string.",
      call. = FALSE
    )
  }

  # Validate Spanish translation
  if (!is.character(spanish) || length(spanish) != 1L) {
    stop(
      "`spanish` must be a single character string.",
      call. = FALSE
    )
  }

  # Select updated_via value
  updated_via <- match.arg(updated_via)

  # Validate Weblate status
  if (
    length(weblate) != 1L ||
    (!is.na(weblate) &&
      !weblate %in% c("include", "exclude"))
  ) {
    stop(
      "`weblate` must be 'include', 'exclude', or NA.",
      call. = FALSE
    )
  }

  # Find an existing entry
  existing <- which(
    tolower(glossary[["english"]]) ==
      tolower(english)
  )

  # Update existing entry
  if (length(existing) > 0L) {

    glossary[["spanish"]][existing] <- spanish
    glossary[["synonym"]][existing] <- synonym
    glossary[["observation"]][existing] <- observation
    glossary[["updated_via"]][existing] <- updated_via
    glossary[["weblate"]][existing] <- weblate

    return(glossary)
  }

  # Create new glossary entry
  new_entry <- data.frame(
    english = english,
    spanish = spanish,
    synonym = synonym,
    observation = observation,
    source = "User",
    source_url = NA_character_,
    retrieved_at = Sys.Date(),
    added_via = updated_via,
    updated_via = updated_via,
    weblate = weblate,
    location = NA_character_,
    id = NA_character_,
    fuzzy = NA,
    context = NA_character_,
    translator_comments = NA_character_,
    developer_comments = NA_character_,
    stringsAsFactors = FALSE
  )

  # Add new entry
  dplyr::bind_rows(
    glossary,
    new_entry
  )
}
