test_that("prepare_data works", {

  set.seed(123)

  data("data_raw_fr")

  extract_data_raw_fr <- data_raw_fr |>
    dplyr::select(
      c(
        "Fiche d\xE2\x80\x99informations ID",
        "Nom",
        "Description",
        "Niveau",
        "I", "II", "III",
        "A", "B", "C", "D",
        "Th\xC3\xA8me",
        "Groupe cible",
        "Setting"
      )
    ) |>
    dplyr::slice(
      1:5
    )

  expect_equal(
    object = prepare_data(
      data = extract_data_raw_fr,
      nb_min_word_in_desc = 4
    ),
    expected = structure(
      list(
        fiche_d_informations_id =
          c("F178", "F177", "F176", "F175", "F174"),
        nom = c(
          "Forum pour les questions liées à la vieillesse",
          "Aperçu des offres de prévention recommandées pour les écoles dans le canton de Bâle-Campagne",
          "find help",
          "Webinaires pour le travail communal dans le domaine du vieillissement",
          "Plans directeurs cantonaux - Environnement propice à l’activité physique"
        ),
        niveau = c(
          "Policy",
          "Mise en réseau",
          "Information au public",
          "Information au public",
          "Policy"
        ),
        i_enfants_adolescents = c("Non", "Oui", "Oui", "Non", "Oui"),
        ii_adultes = c("Non", "Non", "Non", "Non", "Non"),
        iii_personnes_agees = c("Oui", "Non", "Oui", "Oui", "Oui"),
        a_enfants_adolescents_nutrition_activite_physique = c(
          "Non",
          "Non",
          "Non",
          "Non",
          "Non"
        ),
        b_personnes_agees_nutrition_activite_physique = c(
          "Non",
          "Non",
          "Non",
          "Non",
          "Non"
        ),
        c_enfants_adolescents_sante_psychique = c(
          "Non",
          "Non",
          "Non",
          "Non",
          "Non"
        ),
        d_personnes_agees_sante_psychique = c(
          "Non",
          "Non",
          "Non",
          "Non",
          "Non"
        ),
        theme_activite_physique = c(
          "Oui",
          "Oui",
          "Oui",
          "Oui",
          "Oui"
        ),
        theme_alimentation = c(
          "Oui",
          "Oui",
          "Oui",
          "Oui",
          "Non"
        ),
        theme_sante_psychique = c(
          "Oui",
          "Oui",
          "Oui",
          "Oui",
          "Non"
        ),
        groupe_cible_non_applicable = c(
          "Oui",
          "Oui",
          "Non",
          "Non",
          "Oui"
        ),
        groupe_cible_ensemble_de_la_population = c(
          "Non",
          "Non",
          "Oui",
          "Non",
          "Non"
        ),
        groupe_cible_les_multiplicateur_trice_s_sont_le_groupe_cible_primaire_de_cette_mesure = c(
          "Non",
          "Non",
          "Non",
          "Oui",
          "Non"
        ),
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
        ),
        desc_offre = c(
          0,
          2,
          4,
          0,
          0
        ),
        desc_santé = c(
          1,
          1,
          3,
          1,
          3
        )
      ),
      row.names = c(NA, -5L),
      class = c("tbl_df", "tbl", "data.frame")
    )
  )

})
