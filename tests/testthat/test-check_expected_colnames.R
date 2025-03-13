test_that("check_expected_colnames works in FR", {

  data("data_raw_fr")

  expect_error(
    check_expected_colnames(
      data_raw_fr,
      lang = "fr"
    ),
    NA
  )

  expect_error(
    check_expected_colnames(
      data_raw_fr |> dplyr::select(-Nom),
      lang = "fr"
    )
  )

})

test_that("check_expected_colnames works in DE", {

  data("data_raw_de")

  expect_error(
    check_expected_colnames(
      data_raw_de,
      lang = "de"
    ),
    NA
  )

  expect_error(
    check_expected_colnames(
      data_raw_de |> dplyr::select(-Nom),
      lang = "de"
    )
  )

})

test_that("check_expected_colnames does not work for another language", {

  data("data_raw_fr")

  expect_error(
    check_expected_colnames(
      data_raw_fr,
      lang = "it"
    )
  )

})
