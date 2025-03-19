test_that("interpret_clusters works", {

  skip_on_ci()

  data("data_fr")

  res_analysis <- get_clusters(
    data = data_fr |>
      dplyr::slice(1:20)
  )

  res_interpret_clusters <- interpret_clusters(
    res_analysis = res_analysis
  )

  expect_equal(
    object = names(
      res_interpret_clusters
    ),
    expected = c(
      "intro_llm",
      "request_llm",
      "res_prompt_llm",
      "res_desc_llm_fr",
      "res_desc_llm_de"
    )
  )

})
