test_that("parse_description works", {

  skip_on_ci()

  set.seed(123)

  data("data_raw_fr")

  data_description <- data_raw_fr |>
    keep_mandatory_col() |>
    clean_colnames() |>
    dplyr::select(
      fiche_d_informations_id,
      description
    ) |>
    dplyr::slice(
      1:5
    )

  expect_equal(
    object = parse_description(
      data = data_description,
      nb_min_word = 2
    ) |>
      dplyr::select(-fiche_d_informations_id) |>
      colnames() |>
      stringi::stri_sort(locale = "fr"),
    expected = c(
      "desc_accompagner",
      "desc_canton",
      "desc_cantonal",
      "desc_compte",
      "desc_conseil",
      "desc_d\u00E9j\u00E0",
      "desc_demande",
      "desc_devoir",
      "desc_directeur",
      "desc_direction",
      "desc_domaine",
      "desc_\u00EAtre",
      "desc_faire",
      "desc_find",
      "desc_forme",
      "desc_forum",
      "desc_help",
      "desc_lier",
      "desc_lieu",
      "desc_mettre",
      "desc_mise",
      "desc_offre",
      "desc_permettre",
      "desc_physique",
      "desc_place",
      "desc_plan",
      "desc_plus",
      "desc_pouvoir",
      "desc_prendre",
      "desc_processus",
      "desc_promotion",
      "desc_psychique",
      "desc_question",
      "desc_recherche",
      "desc_r\u00E9pertoire",
      "desc_r\u00E9seau",
      "desc_r\u00E9sidence",
      "desc_sant\u00E9",
      "desc_social",
      "desc_soutien",
      "desc_suisse",
      "desc_trouver",
      "desc_vieilless"
    )
  )

})
