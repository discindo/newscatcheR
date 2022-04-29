test_that("get_news returns a tibble with feed contents", {
  # adding a small time delay to avoid simultaneous posts to the api
  Sys.sleep(3)

  # Skip when tests are run on CRAN
  skip_on_cran()

  # Get the news
  output_news <- get_news("ycombinator.com")

  # What's returned
  expect_s3_class(output_news, "data.frame")

  # Skip if the website could not be loaded
  skip_if_offline("bbc.com")

  # Get the news
  output_news <- get_news("bbc.com", topic = "travel")

  # What's returned
  expect_s3_class(output_news, "data.frame")

  # numbers return an error
  expect_error(output_news = get_news(123))

  # url not in database returns error
  expect_error(output_news = get_news("example.com"))

})

