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
attachment::att_to_description()
devtools::release()
usethis::use_github_release()

# Prepare raw data for rda.

library(tidyverse)


rss_table_raw <- readr::read_delim("inst/external-data/rss_table.csv",
                            "|", escape_double = FALSE, trim_ws = TRUE)

# one url has non ascii characters so make sure we use escaped

nonUTF <- iconv(rss_table$rss_endpoint, from="UTF-8", to="ASCII")
index<-is.na(nonUTF)
rss_table$rss_endpoint[index]

hakolhayehudi <- "https://www.hakolhayehudi.co.il/rss/%D7%AA%D7%A8%D7%95%D7%9D_%D7%9C%D7%A0%D7%95"


rss_table <- rss_table_raw %>%
  mutate(rss_endpoint = if_else(str_detect(rss_endpoint,
                         "hakolhayehudi"), hakolhayehudi, rss_endpoint))


usethis::use_data(rss_table, overwrite = TRUE)
