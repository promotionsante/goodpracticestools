#' Plot the distribution of the levels of projects.
#'
#' @param data  Data frame. Prepared data about projects.
#' @param color Character. Color for the bubbles.
#' @param title_font_size Integer. Font size for the title.
#' @param text_font_size Integer. Font size for the texts.
#' @param font_family Character.
#' @param language Character. "fr" or "de".
#'
#' @importFrom dplyr mutate case_when  mutate desc
#' @importFrom forcats fct_reorder
#' @importFrom ggplot2 ggplot aes ggtitle theme_minimal theme element_text element_blank
#' @importFrom ggiraph geom_col_interactive girafe
#' @importFrom systemfonts system_fonts
#'
#' @return An interactive plot
#' @export
plot_distrib_level <- function(
    data,
    color = "#c1e1ec",
    title_font_size = 16,
    text_font_size = 11,
    font_family = "DIN Pro",
    language = c("fr", "de")
) {

  language <- match.arg(language)

  text_types <- trad_plot_distrib_level[[language]]$text_types
  title <- trad_plot_distrib_level[[language]]$title

  if (!(font_family %in% system_fonts()$family)) {
    font_family <- "Times"
  }

  data_language_ok <- data |>
    mutate(
      niveau = case_when(
        niveau == "Intervention" ~ text_types[["intervention"]],
        niveau == "Information au public" ~ text_types[["public information"]],
        niveau == "Mise en r\u00e9seau" ~ text_types[["networking"]],
        niveau == "Policy" ~ text_types[["policy"]]
      )
    )

  data_language_ok <- data_language_ok |>
    mutate(
      niveau = fct_reorder(
        factor(niveau), desc(n)
      )
    )

  p <- ggplot(data_language_ok, aes(x = niveau, y = n)) +
    geom_col_interactive(
      aes(tooltip = paste(niveau, "<br>", n)),
      fill = color
    ) +
    ggtitle(title) +
    theme_minimal() +
    theme(
      plot.title = element_text(
        family = font_family,
        size = title_font_size,
        hjust = 0.5
      ),
      axis.title = element_blank(),
      axis.text = element_text(
        size = text_font_size
      ),
      legend.position = "none"
    )

  girafe(ggobj = p)

}
