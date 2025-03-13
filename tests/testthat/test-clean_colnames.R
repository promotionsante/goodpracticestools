test_that("clean_colnames works", {

  data("data_raw_fr")

  extract_data_raw_fr <- data_raw_fr |>
    keep_mandatory_col() |>
    dplyr::slice(
      1
    )

  expect_equal(
    object = clean_colnames(
      data = extract_data_raw_fr
    ) |>
      colnames(),
    expected =
      c(
        "fiche_d_informations_id",
        "nom",
        "description",
        "niveau",
        "i_enfants_adolescents",
        "ii_adultes",
        "iii_personnes_agees",
        "a_enfants_adolescents_nutrition_activite_physique",
        "b_personnes_agees_nutrition_activite_physique",
        "c_enfants_adolescents_sante_psychique",
        "d_personnes_agees_sante_psychique",
        "theme",
        "groupe_cible",
        "setting"
      )
  )

})
