context("data-visualization.R")

data <- tibble::tribble(
  ~x, ~y, ~z,
  "a", 1, TRUE,
  "b", 2, FALSE,
  "c", 1, FALSE
)

test_that("visualize_data_types inherits gg", {
  res <- visualize_data_types(data)
  expect_true(inherits(res, "gg"))
})

test_that("visualize_data_types returns NULL if data is wrong class", {
  res1 <- visualize_data_types(list(x = c("a", "b", "c"), y = c(1, 2, 1)))
  res2 <- visualize_data_types(1)
  res3 <- visualize_data_types(c("a", "b", "c"))
  expect_null(res1)
  expect_null(res2)
  expect_null(res3)
})

test_that("data_summary returns NULL if data is wrong class", {
  res1 <- data_summary(list(x = c("a", "b", "c"), y = c(1, 2, 1)))
  res2 <- data_summary(1)
  res3 <- data_summary(c("a", "b", "c"))
  expect_null(res1)
  expect_null(res2)
  expect_null(res3)
})

test_that("data_summary returns table with custom value column", {
  expected <- list(
    "a (1), b (1), c (1)",
    "TRUE (1), FALSE (2)",
    "1 (2), 2 (1)"
  )
  res <- data_summary(data)
  expect_true(inherits(res, "tbl_df"))
  expect_equal(as.list(res$value_occurrence), expected)
})

test_that("summarize_values returns string summary", {
  val1 <- list("a", "a", "a")
  val2 <- list("a", "b", "b")
  val3 <- list("a", "b", "c")
  val4 <- list(1, 2, 2, 1)
  res1 <- summarize_values(val1)
  res2 <- summarize_values(val2)
  res3 <- summarize_values(val3)
  res4 <- summarize_values(val4)
  expect_equal(res1, "a (3)")
  expect_equal(res2, "a (1), b (2)")
  expect_equal(res3, "a (1), b (1), c (1)")
  expect_equal(res4, "1 (2), 2 (2)")
})

test_that("summarize_values returns NULL if values = NULL", {
  res <- summarize_values(NULL)
  expect_null(res)
})
