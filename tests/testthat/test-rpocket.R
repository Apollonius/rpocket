context("test-rpocket.R")

test_that("get_data function returns a list", {
  # make sure can find keys file
  expect_true(file.exists(file.path("../..", "keys.r")))
  keys <- file.path("../../keys.r")
  source(keys)

  # get data
  data <- get_data(consumer_key=consumer_key, access_token=access_token, since="1515967450")
  data_list <- class(data)
  expect_match("list", data_list)
})
