test_that("describe_url returns a message with topic", {

  # Get the news
  output_describe <- describe_url("ycombinator.com")

  # What's returned
  expect_null(output_describe, "character")

})
