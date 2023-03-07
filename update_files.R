library(harmonizRv3)
library(fs)
library(goodpractice)
usethis::use_pkgdown()
usethis::use_github_action_check_standard()
usethis::use_readme_rmd()


# https://devguide.ropensci.org/building.html
# https://r-pkgs.org/release.html#sec-release-process
# https://kalimu.github.io/post/checklist-for-r-package-submission-to-cran/

# usethis::use_package_doc()
# usethis::use_vignette("fabR-vignette")
# usethis::use_cran_comments()
devtools::document(roclets = c('rd', 'collate', 'namespace', 'vignette'))
devtools::build_readme()
spelling::spell_check_package(".")
devtools::build_manual()
devtools::check()
goodpractice::gp()
devtools::build(manual = TRUE)
# push to git
devtools::submit_cran()
# push to git


fs::dir_delete("/staff/gfabre/fabR/docs")
fs::dir_delete("/staff/gfabre/fabR-documentation/docs")
pkgdown::build_site()
fs::dir_copy(
  "/staff/gfabre/fabR/docs",
  "/staff/gfabre/fabR-documentation/docs",
  overwrite = TRUE
)

fabR::fabR_help()
