#' Prepare raw data for statistical data analysis
#'
#' @param data Data frame. Raw data about projects.
#' @param nb_min_word_in_desc Integer. Minimum number of occurences to keep a word.
#'
#' @importFrom dplyr mutate across any_of
#'
#' @return Data frame ready for analysis
#' @export
#'
#' @example
#' data("data_raw_fr")
#' prepare_data(
#'    data = data_raw_fr
#' )
prepare_data <- function(
    data,
    nb_min_word_in_desc = 10
) {

  check_expected_col(
    data = data
  )

  data |>
    keep_mandatory_col() |>
    clean_colnames() |>
    create_disjunctive_col(
      theme
    ) |>
    create_disjunctive_col(
      groupe_cible
    ) |>
    create_disjunctive_col(
      setting
    ) |>
    mutate(
      across(
        any_of(
          c(
            "i_enfants_adolescents",
            "ii_adultes",
            "iii_personnes_agees",
            "a_enfants_adolescents_nutrition_activite_physique",
            "b_personnes_agees_nutrition_activite_physique",
            "c_enfants_adolescents_sante_psychique",
            "d_personnes_agees_sante_psychique"
          )
        ),
        ~ ifelse(is.na(.x), "Non", "Oui")
      )
    ) |>
    parse_description(
      nb_min_word = nb_min_word_in_desc
    )

}
