test_that("prepare_data works", {

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
    object = prepare_data(data = extract_data_raw_fr),
    expected = structure(
      list(
        fiche_information_id =
          c("F178", "F177", "F176", "F175", "F174"),
        nom = c(
          "Forum pour les questions liées à la vieillesse",
          "Aperçu des offres de prévention recommandées pour les écoles dans le canton de Bâle-Campagne",
          "find help",
          "Webinaires pour le travail communal dans le domaine du vieillissement",
          "Plans directeurs cantonaux - Environnement propice à l’activité physique"
        ),
        description = c(
          "Le \"Forum pour les questions liées à la vieillesse\" est un forum pour les questions liées à la vieillesse accompagne et conseille le département de la santé et des affaires sociales. En tant que commission d'accompagnement, il prend en compte les demandes de l'extérieur, les transmet à l'Office Vieillesse et Famille et, inversement, prend en compte les demandes pour le travail sur place.",
          "L'aperçu contient des offres sous forme de projets, d'ateliers et de matériel pédagogique axés sur le renforcement de la santé physique et psychique. L'objectif est d'avoir une vue d'ensemble des offres cantonales et régionales qui soutiennent les écoles de Bâle-Campagne dans la mise en œuvre du programme scolaire.",
          "Trouver des offres de conseil et de soutien adaptées dans le domaine de la santé et du social peut souvent être une tâche exigeante et frustrante qui prend beaucoup de temps. Le répertoire en ligne « find help » du Forum pour la santé psychique de la Suisse orientale offre un soutien dans ce domaine. Une fonction de recherche complète permet de trouver des offres de conseil et de soutien dans le domaine de la santé et du social à l'aide de mots-clés, du lieu de résidence et d'autres filtres. Seules les offres qui sont effectivement disponibles pour le lieu de résidence indiqué sont affichées. Le répertoire a été mis en place en collaboration avec plusieurs cantons et comprend déjà plus de 4000 offres vérifiées et est intégré à plus de 30 sites web. La plate-forme « find help » utilisée en commun a déjà permis de remplacer de nombreux répertoires gérés individuellement.",
          "Les professionnels actifs au niveau communal sont informés par de brefs webinaires sur des thèmes relatifs à la prévention et à la promotion de la santé chez les personnes âgées. Ils découvrent des exemples de bonnes pratiques et se mettent en réseau.\r\n",
          "La recherche a montré qu'un environnement propice à l'activité physique incite les gens à bouger davantage. Cette connaissance doit être exploitée et ancrée dans les plans directeurs cantonaux. Pour ce faire, les directions cantonales de la santé se sont mises en réseau avec la personne responsable du plan directeur dans le canton et ont clarifié de quelle manière elles pourraient être impliquées dans le prochain processus de révision. Idéalement, cela devrait se faire au début de ce processus et pas seulement lors de la prise de position publique. Promotion Santé Suisse accompagne les directions de la santé intéressées."
        ),
        niveau = c(
          "Policy",
          "Mise en réseau",
          "Information au public",
          "Information au public",
          "Policy"
        ),
        enfants_adolescents = c(NA, "X", "X", NA, "X"),
        adultes = c(NA, NA, NA, NA, NA),
        personnes_agees = c("X", NA, "X", "X", "X"),
        a_enfants_adolescents_nutrition_activite_physique = c(
          NA_character_,
          NA_character_,
          NA_character_,
          NA_character_,
          NA_character_
        ),
        b_personnes_agees_nutrition_activite_physique = c(
          NA_character_,
          NA_character_,
          NA_character_,
          NA_character_,
          NA_character_
        ),
        c_enfants_adolescents_sante_psychique = c(
          NA_character_,
          NA_character_,
          NA_character_,
          NA_character_,
          NA_character_
        ),
        d_personnes_agees_sante_psychique = c(
          NA_character_,
          NA_character_,
          NA_character_,
          NA_character_,
          NA_character_
        ),
        theme = c(
          "Activité physique, Alimentation, Santé psychique",
          "Santé psychique, Alimentation, Activité physique",
          "Santé psychique, Alimentation, Activité physique",
          "Alimentation, Santé psychique, Activité physique",
          "Activité physique"
        ),
        groupe_cible = c(
          "Non applicable",
          "Non applicable",
          "Ensemble de la population",
          "Les multiplicateur-trice-s sont le groupe cible primaire de cette mesure.",
          "Non applicable"
        ),
        setting = c(
          "Autres settings: Sämtliche Themen rund um das Alter",
          "Commune/quartier/environnement résidentiel, Installation de loisirs / association",
          "Famille/domicile, Lieux d’accueil et d’éducation extra-familiaux, Installation de loisirs / association, Commune/quartier/environnement résidentiel, École (de l’école enfantine au niveau tertiaire)",
          "Commune/quartier/environnement résidentiel",
          "Pas de setting spécifique"
        )
      ),
      row.names = c(NA, -5L),
      class = c("tbl_df", "tbl", "data.frame")
    )
  )

})
