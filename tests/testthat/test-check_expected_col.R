test_that("check_expected_col works", {

  data("data_raw_fr")

  expect_error(
    check_expected_col(
      data_raw_fr
    ),
    NA
  )

  expect_error(
    check_expected_col(
      data_raw_fr |> dplyr::select(-Nom)
    )
  )

})
