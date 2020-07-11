test_that("filter_urls filters the feeds dataset", {

  # Filter topic
  output_filter <- filter_urls(topic = "tech")

  # What's returned
  expect_s3_class(output_filter, "data.frame")

  # Filter country
  output_filter <- filter_urls(country = "US")

  # What's returned
  expect_s3_class(output_filter, "data.frame")

  # Filter languge
  output_filter <- filter_urls(language = "en")

  # What's returned
  expect_s3_class(output_filter, "data.frame")

  # Works with two arguments
  output_filter <- filter_urls(topic = "tech", country = "US")

  # What's returned
  expect_s3_class(output_filter, "data.frame")

  # Works with three arguments
  output_filter <- filter_urls(topic = "tech", country = "US", language = "en")

  # What's returned
  expect_s3_class(output_filter, "data.frame")

  # And check the errors
  expect_message(output_filter = filter_urls(topic = "mytopic"))

  expect_message(output_filter = filter_urls(topic = "tech", country = "XX"))

  expect_error(output_filter = filter_urls(topic = 123))

})
