test_that("get_headlines works", {
  # Get path
  datapath <- system.file("example-data/rss_example_table.csv",
                          package = "newscatcheR")
  # Read data with {readr}
  example_data <- readr::read_delim(datapath, delim = "|",
                                    escape_double = FALSE, trim_ws = TRUE)

  # Get the news
  output_headlines <- get_headlines("news.ycombinator.com")

  # What's returned
  expect_is(output_headlines, "data.frame")
  expect_equal(ncol(output_headlines), 1)

})
