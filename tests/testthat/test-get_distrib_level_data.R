test_that("get_distrib_level_data works", {
  data("data_fr")

  expect_equal(
    object = get_distrib_level_data(data = data_fr),
    expected = structure(
      list(
        niveau = c(
          "Information au public",
          "Intervention",
          "Mise en réseau",
          "Policy"
        ),
        n = c(31L, 112L, 14L, 13L)
      ),
      row.names = c(NA, -4L),
      class = c("tbl_df", "tbl", "data.frame")
    )
  )


})
