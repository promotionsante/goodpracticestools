test_that("plot_distrib_level works", {

  data("data_fr")

  expect_s3_class(
    object = get_distrib_level_data(
      data = data_fr
    ) |>
      plot_distrib_level(),
    class = "girafe"
  )

  expect_s3_class(
    object = get_distrib_level_data(
      data = data_fr
    ) |>
      plot_distrib_level(
        font_family = "noexisting"
      ),
    class = "girafe"
  )

})
