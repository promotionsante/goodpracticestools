#' Prepare raw data for statistical data analysis
#'
#' @param data Data frame. Raw data about projects.
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
    data
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
    )

}
