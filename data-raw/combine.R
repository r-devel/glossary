## code to prepare `combine` dataset goes here

usethis::use_data(combine, overwrite = TRUE)

# read csv file from ropensci glossary

ropensci_glossary <- read.csv("https://raw.githubusercontent.com/ropensci-review-tools/glossary/master/glossary.csv")
