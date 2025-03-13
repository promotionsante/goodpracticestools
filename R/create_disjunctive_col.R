#' Create disjonctive a dijonctive column on the dataset
#'
#' @param data Data frame. Raw data about projects.
#' @param col Symbol. Column to be transformed.
#' @param delim Character. Delim of values in the original column.
#'
#' @importFrom rlang as_label enquo :=
#' @importFrom tidyr separate_longer_delim pivot_wider
#' @importFrom dplyr mutate
#' @importFrom janitor clean_names
#'
#' @return Data with the column transformed
create_disjunctive_col <- function(
    data,
    col,
    delim = ", "
) {

  column_name <- paste0(as_label(enquo(col)), "_")

  data |>
    separate_longer_delim(
      {{col}}, delim = delim
    ) |>
    mutate(
      {{col}} := paste0(column_name, {{col}}),
      {{col}} := factor({{col}}),
      value = "Oui"
    ) |>
    pivot_wider(
      names_from = {{col}},
      values_from = value,
      values_fill = list(value = "Non")
    ) |>
    clean_names()

}
