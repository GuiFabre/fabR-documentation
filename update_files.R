library(fabR)
# usethis::use_pkgdown()

# devtools::document(roclets = c('rd', 'collate', 'namespace', 'vignette'))
# devtools::build_readme()
# devtools::build_rmd('NEWS.Rmd')
fs::dir_delete("docs")
pkgdown::build_site()

fs::dir_delete("../fabR-documentation/docs")
fs::dir_copy(
  "docs",
  "../fabR-documentation/docs",
  overwrite = TRUE)

# push to git
"https://github.com/maelstrom-research/madshapR-documentation/actions/"
harmonizR_help()
