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
  expect_null(filter_urls(topic = "mytopic"))
  expect_null(filter_urls(country = "gondor"))
  expect_null(filter_urls(language = "klingon"))

  expect_null(filter_urls(topic = "tech", country = "XX"))
  expect_null(filter_urls(topic = "tech", language = "romulan"))
  expect_null(filter_urls(country = "tech", topic = "XX"))

  expect_null(filter_urls(topic = "tech", country = "XX", language = "de"))
  expect_null(filter_urls(topic = "tech", language = "romulan", country = "US"))
  expect_null(filter_urls(topic = "musi", country = "US", language = "en"))

  expect_error(filter_urls(topic = 1, country = "XX"))
  expect_error(filter_urls(topic = list("tech"), language = "romulan"))
  expect_error(filter_urls(topic = "tech", country = 22))

  expect_error(filter_urls(topic = NA))
  expect_error(filter_urls(country = 123))
  expect_error(filter_urls(language = tibble("lang"="klingon")))


  expect_error(filter_urls(topic = 123))

})
