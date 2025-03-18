test_that("get_clusters works", {

  data("data_fr")

  res_analyze <- get_clusters(
    data = data_fr
  )

  expect_equal(
    object = names(
      res_analyze
    ),
    expected = c(
      "res_mca",
      "res_hcpc",
      "data"
    )
  )

  expect_equal(
    object = res_analyze$res_mca$eig[1],
    expected = 0.1022119,
    tolerance = 0.01
  )

  expect_equal(
    object = length(
      unique(
        res_analyze$res_hcpc$data.clust$clust
        )
      ),
    expected = 3
  )

})
