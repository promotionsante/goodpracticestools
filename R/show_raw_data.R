#' Show the raw data into an interactive table.
#'
#' @param data Data frame. Raw data about projects.
#' @param nb_by_page Integer. Number of projects to be displayed by page.
#' @param language Character. "fr" or "de".
#'
#' @importFrom DT datatable
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

  col_widths <- lapply(column_names, function(col) list(width = '200px'))
  names(col_widths) <- column_names

  for (col in vec_large_col[[language]]) {
    col_widths[[col]]$width <- '1000px'
  }

  for (col in vec_medium_col[[language]]) {
    col_widths[[col]]$width <- '500px'
  }

  column_defs <- lapply(seq_along(col_widths), function(i) {
    list(targets = i, width = col_widths[[i]]$width)
  })

  datatable(
    data,
    options = list(
      autoWidth = TRUE,
      pageLength = nb_by_page,
      columnDefs = column_defs
    ),
    filter = 'top'
  )

}
