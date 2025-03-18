#' Show the raw data into an interactive table.
#'
#' @param data Data frame. Raw data about projects.
#' @param nb_by_page Integer. Number of projects to be displayed by page.
#' @param language Character. "fr" or "de".
#'
#' @importFrom reactable reactable colDef
#' @importFrom purrr set_names map
#'
#' @return An interactive table
#' @export
show_raw_data <- function(
    data,
    nb_by_page = 2,
    language = c("fr", "de")
) {

  language <- match.arg(language)

  column_names <- colnames(data)

  list_col_size <- column_names |>
    set_names() |>
    map(
      ~ colDef(width = 200)
    )

  list_col_size[vec_large_col[[language]]] <- map(
    vec_large_col[[language]],
    ~ colDef(width = 1000)
  )

  list_col_size[vec_medium_col[[language]]] <- map(
    vec_medium_col[[language]],
    ~ colDef(width = 500)
  )

  reactable(
    data,
    defaultPageSize = nb_by_page,
    columns = list_col_size,
    searchable = TRUE
  )

}
