#' Get the data for the plot about the distribution of levels
#'
#' @param data  Data frame. Prepared data about projects.
#'
#' @importFrom dplyr count
#'
#' @return Data frame. Number of observations by level
#' @export
get_distrib_level_data <- function(
    data
) {

  data |>
    count(
      niveau
    )

}
