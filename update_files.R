library(harmonizRv3)
library(fs)
# usethis::use_pkgdown()

devtools::document(roclets = c('rd', 'collate', 'namespace', 'vignette'))
pkgdown::build_site()

fs::dir_copy(
  "/staff/gfabre/fabR/docs",
  "/staff/gfabre/fabR-documentation/docs",
  overwrite = TRUE
)

fabR::fabR_help()
