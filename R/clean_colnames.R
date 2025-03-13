#' Clean colnames and use more explicit ones for some columns
#'
#' @param data Data frame. Raw data about projects.
#'
#' @importFrom janitor clean_names
#' @importFrom dplyr rename
#'
#' @return Data frame with mandatory columns
clean_colnames <- function(
    data
) {

  data |>
    clean_names() |>
    rename(
      i_enfants_adolescents = i,
      ii_adultes = ii,
      iii_personnes_agees = iii,
      a_enfants_adolescents_nutrition_activite_physique = a,
      b_personnes_agees_nutrition_activite_physique = b,
      c_enfants_adolescents_sante_psychique = c,
      d_personnes_agees_sante_psychique = d
    )

}
