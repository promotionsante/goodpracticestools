test_that("show_raw_data works", {

  data("data_raw_fr")

  expect_s3_class(
    object = show_raw_data(
      data = data_raw_fr |>
        dplyr::slice(1:2)
    ),
    class = "datatables"
  )

})
