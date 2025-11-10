## code to prepare `combine` dataset goes here

usethis::use_data(combine, overwrite = TRUE)

# read csv file from ropensci glossary

ropensci_url <- "https://raw.githubusercontent.com/ropensci-review-tools/
  glossary/master/glossary.csv"

ropensci_glossary <- read.csv(ropensci_url, stringsAsFactors = FALSE)

# access glossary from weblate URL (for English terms)

weblate_url <- "https://translate.rx.studio/download/r-project/glossary/
  en/?format=csv"

temp <- tempfile(fileext = ".csv")
download.file(weblate_url, temp, mode = "wb")
weblate_glossary <- read.csv(temp, stringsAsFactors = FALSE)

# combine the "english" column from ropensci_glossary with
# the "source" column from weblate_glossary keeping only
# the unique terms

combine <- unique(c(ropensci_glossary$english, weblate_glossary$source))

# save combine dataset
usethis::use_data(combine, overwrite = TRUE)
