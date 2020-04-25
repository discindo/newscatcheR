# Document functions and dependencies
attachment::att_to_description()
# Check the package
devtools::check()
# Install the package
devtools::install()
# Add functions and tests
usethis::use_r("get_news")
usethis::use_r("get_headlines")
usethis::use_test("get_news")
usethis::use_test("get_headlines")
