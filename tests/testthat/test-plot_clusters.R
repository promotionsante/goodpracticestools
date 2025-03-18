test_that("plot_clusters works", {

  data("data_fr")
  data("data_raw_de")

  res_analysis <- get_clusters(
    data = data_fr
  )

  expect_s3_class(
    object = plot_clusters(
      res_analysis = res_analysis
    ),
    class = "girafe"
  )

  expect_s3_class(
    object = plot_clusters(
      res_analysis = res_analysis,
      data_raw_de = data_raw_de,
      language = "de"
    ),
    class = "girafe"
  )

  expect_s3_class(
    object = plot_clusters(
      res_analysis = res_analysis,
      font_family = "noexisting"
    ),
    class = "girafe"
  )

})
