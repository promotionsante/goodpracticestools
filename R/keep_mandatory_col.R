#' Keep only mandatory columns
#'
#' @param data Data frame. Raw data about projects.
#'
#' @importFrom dplyr select
#'
#' @return Data frame with mandatory columns
keep_mandatory_col <- function(
    data
) {

  data |>
    select(vec_mandatory_col)

}
