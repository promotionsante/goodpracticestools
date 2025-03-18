#' Plot the distribution of the types of projects.
#'
#' @param data  Data frame. Prepared data about projects.
#' @param color Character. Color for the bubbles.
#' @param font_family Character. Font family.
#' @param title_font_size Character. Font size for the title.
#' @param text_font_size Character. Font size for the texts.
#' @param language Character. "fr" or "de".
#'
#' @importFrom highcharter highchart hc_chart hc_title hc_xAxis hc_yAxis hc_add_series hc_annotations hc_tooltip hcaes
#' @importFrom showtext font_add showtext_auto
#' @importFrom dplyr mutate
#'
#' @return An interactive plot
plot_distrib_type <- function(
    data,
    color = "#c1e1ec",
    font_family = "DIN Condensed",
    title_font_size = "16px",
    text_font_size = "11px",
    language = c("fr", "de")
) {

  language <- match.arg(language)

  if (language == "fr") {
    text_types <- list(
      "nutrition" = "Nutrition et activité physique",
      "mental" = "Santé psychique",
      "kids" = "Enfants/adolescents",
      "seniors" = "Personnes âgées"
    )
    title <- "Répartition des types de projets"
  }

  if (language == "de") {
    text_types <- list(
      "nutrition" = "Ernährung und körperliche Aktivität",
      "mental" = "Psychische Gesundheit",
      "kids" = "Kinder/Jugendliche",
      "seniors" = "Ältere Menschen"
    )
    title <- "Verteilung der Projekttypen"
  }

  if (font_family == "DINPro") {
    font_add(
      family = "DINPro",
      regular = system.file(
        "font/DINPro.otf",
        package = "goodpracticestools"
      )
    )
    showtext_auto()
  }

  data <- data |>
    mutate(color = color)

  highchart() |>
    hc_chart(type = "scatter") |>
    hc_title(
      text = title,
      style = list(fontFamily = font_family, fontSize = title_font_size)
    ) |>
    hc_xAxis(
      title = list(text = ""),
      labels = list(enabled = FALSE),
      min = 0,
      max = 2.5,
      visible = FALSE
    ) |>
    hc_yAxis(
      title = list(text = ""),
      labels = list(enabled = FALSE),
      min = 0,
      max = 2.5,
      visible = FALSE
    ) |>
    hc_add_series(
      data = data, type = "scatter",
      hcaes(x = x, y = y, size = size, color = color),
      marker = list(symbol = "circle"),
      showInLegend = FALSE) |>
    hc_annotations(
      list(
        labelOptions = list(
          backgroundColor = "transparent",
          borderColor = "transparent",
          style = list(
            fontSize = text_font_size,
            fontFamily = font_family,
            color = "black"
          )
        ),
        labels =
          list(
            list(
              point = list(x = 1, y = 2.3, xAxis = 0, yAxis = 0),
              text = text_types[["nutrition"]]
            ),
            list(
              point = list(x = 2, y = 2.3, xAxis = 0, yAxis = 0),
              text = text_types[["mental"]]
            ),
            list(
              point = list(x = 0.3, y = 1.82, xAxis = 0, yAxis = 0),
              text = text_types[["kids"]]
            ),
            list(
              point = list(x = 0.3, y = 0.82, xAxis = 0, yAxis = 0),
              text = text_types[["seniors"]]
            )
          )
      )
    ) |>
    hc_tooltip(
      pointFormat = "{point.type}<br>{point.size}",
      headerFormat = ""
    )

}
