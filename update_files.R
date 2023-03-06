library(harmonizRv3)
library(fs)
tinytex::tlmgr_install("makeindex")

usethis::use_pkgdown()
usethis::use_github_action_check_standard()
usethis::use_readme_rmd()

fs::dir_delete("/staff/gfabre/fabR/docs")
fs::dir_delete("/staff/gfabre/fabR-documentation/docs")


devtools::build_readme()
# usethis::use_package_doc()
# usethis::use_vignette("fabR-vignette")
devtools::document(roclets = c('rd', 'collate', 'namespace', 'vignette'))
devtools::check()
devtools::build()


pkgdown::build_site()
fs::dir_copy(
  "/staff/gfabre/fabR/docs",
  "/staff/gfabre/fabR-documentation/docs",
  overwrite = TRUE
)

fabR::fabR_help()
