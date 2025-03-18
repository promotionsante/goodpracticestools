#' Get the data for the plot about the distribution of types
#'
#' @param data  Data frame. Prepared data about projects.
#'
#' @importFrom dplyr summarise across mutate case_when
#' @importFrom tidyr pivot_longer
#' @importFrom tidyselect everything
#'
#' @return Data frame. Number of "Oui" by column A/B/C/D
get_distrib_type_data <- function(
    data
) {

  data |>
    summarise(
      across(
        c(
          a_enfants_adolescents_nutrition_activite_physique,
          b_personnes_agees_nutrition_activite_physique,
          c_enfants_adolescents_sante_psychique,
          d_personnes_agees_sante_psychique
        ),
        ~ sum(. == "Oui")
        )
      ) |>
    pivot_longer(
      cols = everything(),
      names_to = "type",
      values_to = "size"
    ) |>
    mutate(
      type = case_when(
        type == "a_enfants_adolescents_nutrition_activite_physique" ~ "A",
        type == "b_personnes_agees_nutrition_activite_physique" ~ "B",
        type == "c_enfants_adolescents_sante_psychique" ~ "C",
        type == "d_personnes_agees_sante_psychique" ~ "D"
      )
    ) |>
    mutate(
      x = c(1, 1, 2, 2),
      y = c(2, 1, 2, 1)
    )

}
