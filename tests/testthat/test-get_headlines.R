test_that("get_news works", {
  # Get path
  datapath <- system.file("example-data/rss_example_table.csv",
                          package = "newscatcheR")
  # Read data with {readr}
  example_data <- readr::read_delim(datapath, delim = "|",
                  escape_double = FALSE, trim_ws = TRUE)

  # Get the news
  output_news <- get_news("news.ycombinator.com")

  # What's returned
  expect_is(output_news, "data.frame")

})

