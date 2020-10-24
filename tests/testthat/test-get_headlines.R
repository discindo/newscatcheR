test_that("get_headlines returns a data frame with one column", {
  # adding a small time delay to avoid simultaneous posts to the api
  Sys.sleep(3)

  # Skip if the website could not be loaded
  skip_if_offline("ycombinator.com")

  # Get the news
  output_headlines <- get_headlines("ycombinator.com")

  # What's returned
  expect_s3_class(output_headlines, "data.frame")
  expect_equal(ncol(output_headlines), 1)

})
