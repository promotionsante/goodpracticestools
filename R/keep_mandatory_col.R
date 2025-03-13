#' Keep only mandatory columns
#'
#' @param data Data frame. Raw data about projects.
#'
#' @importFrom dplyr select
#' @importFrom tidyselect all_of
#'
#' @return Data frame with mandatory columns
keep_mandatory_col <- function(
    data
) {

  data |>
    select(
      all_of(vec_mandatory_col)
    )

}
