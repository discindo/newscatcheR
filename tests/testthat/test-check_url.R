test_that("check_url runs the checks", {

  # numbers return an error
  expect_error(output_check = check_url(123))

  # url not in database returns error
  expect_error(output_check = check_url("example.com"))

})

