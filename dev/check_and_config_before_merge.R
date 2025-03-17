# Check
attachment::att_amend_desc()
pkgload::load_all()
devtools::check()

# Pkgdown
pkgdown::build_site()

# Coverage report
covr::report(
  file = file.path("docs/articles/coverage-report.html")
)
