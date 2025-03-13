test_that("create_disjunctive_col works", {

  data("data_raw_fr")

  data_setting <- data_raw_fr |>
    keep_mandatory_col() |>
    clean_colnames() |>
    dplyr::select(
      fiche_d_informations_id,
      setting
    ) |>
    dplyr::slice(
      1:5
    )

  expect_equal(
    object = create_disjunctive_col(
      data = data_setting,
      col = setting,
      delim = ", "
    ),
    expected = structure(
      list(
        fiche_d_informations_id =
          c("F178", "F177", "F176", "F175", "F174"),
        setting_autres_settings_samtliche_themen_rund_um_das_alter = c(
          "Oui",
          "Non",
          "Non",
          "Non",
          "Non"
        ),
        setting_commune_quartier_environnement_residentiel = c(
          "Non",
          "Oui",
          "Oui",
          "Oui",
          "Non"
        ),
        setting_installation_de_loisirs_association = c(
          "Non",
          "Oui",
          "Oui",
          "Non",
          "Non"
        ),
        setting_famille_domicile = c(
          "Non",
          "Non",
          "Oui",
          "Non",
          "Non"
        ),
        setting_lieux_d_accueil_et_d_education_extra_familiaux = c(
          "Non",
          "Non",
          "Oui",
          "Non",
          "Non"
        ),
        setting_ecole_de_l_ecole_enfantine_au_niveau_tertiaire = c(
          "Non",
          "Non",
          "Oui",
          "Non",
          "Non"
        ),
        setting_pas_de_setting_specifique = c(
          "Non",
          "Non",
          "Non",
          "Non",
          "Oui"
        )
      ),
      row.names = c(NA, -5L),
      class = c("tbl_df", "tbl", "data.frame")
    )
  )

})
