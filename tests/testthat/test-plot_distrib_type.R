test_that("plot_distrib_type works", {

  data("data_fr")

  expect_s3_class(
    object = get_distrib_type_data(
      data = data_fr
    ) |>
    plot_distrib_type(),
    class = "girafe"
  )

})
