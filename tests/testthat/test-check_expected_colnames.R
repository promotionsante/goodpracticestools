test_that("check_expected_colnames works", {

  data("data_raw_fr")

  expect_error(
    check_expected_colnames(
      data_raw_fr
    ),
    NA
  )

  expect_error(
    check_expected_colnames(
      data_raw_fr |> dplyr::select(-Nom)
    )
  )

})
