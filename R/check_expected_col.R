#' Check that mandatory columns are present in the dataset
#'
#' @param data Data frame. Raw data about projects.
#'
#' @importFrom glue glue
#' @return An error if some colnames are absent.
check_expected_col <- function(
    data
    ) {

  if (!all(vec_mandatory_col %in% colnames(data))) {
    stop(
      glue(
        "The dataset must contain -at least- the columns {paste(vec_mandatory_col, collapse = ', ')}"
      )
    )
  }

}
