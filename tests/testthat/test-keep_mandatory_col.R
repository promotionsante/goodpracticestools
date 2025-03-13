test_that("keep_mandatory_col works", {

  data("data_raw_fr")

  expect_equal(
    object = keep_mandatory_col(
      data = data_raw_fr
    ) |> colnames(),
    expected = vec_mandatory_col
  )

})
