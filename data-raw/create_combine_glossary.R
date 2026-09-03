# data-raw/create_combine_glossary.R

# ---------------------------------------------------------

# Retrieve glossary sources

# ---------------------------------------------------------

ropensci_glossary <- get_ropensci_glossary()

weblate_glossary <- get_weblate_glossary()

# ---------------------------------------------------------

# Combine glossaries

# ---------------------------------------------------------

combine_glossary <- combine_glossaries(
ropensci_glossary = ropensci_glossary,
weblate_glossary = weblate_glossary
)

# ---------------------------------------------------------

# Save package data

# ---------------------------------------------------------

usethis::use_data(
combine_glossary,
overwrite = TRUE
)
