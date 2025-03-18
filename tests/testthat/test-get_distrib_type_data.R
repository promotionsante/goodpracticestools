test_that("get_distrib_type_data works", {

  data("data_fr")

  expect_equal(
    object = get_distrib_type_data(
      data = data_fr
    ),
    expected = structure(
      list(
        type = c("A", "B", "C", "D"),
        size = c(74L, 41L, 85L, 53L),
        x = c(1, 1, 2, 2),
        y = c(2, 1.3, 2, 1.3)
      ), row.names = c(NA,-4L),
      class = c("tbl_df", "tbl", "data.frame")
    )
  )

})
