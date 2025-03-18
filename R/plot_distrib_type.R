#' Plot the distribution of the types of projects.
#'
#' @param data  Data frame. Prepared data about projects.
#' @param color Character. Color for the bubbles.
#' @param title_font_size Integer. Font size for the title.
#' @param text_font_size Integer. Font size for the texts.
#' @param font_family Character.
#' @param language Character. "fr" or "de".
#' @param xmin  Integer.
#' @param xmax  Integer.
#' @param ymin  Integer.
#' @param ymax  Integer.
#'
#' @importFrom ggplot2 ggplot aes ggtitle theme_void theme element_text geom_text scale_size_continuous xlim ylim
#' @importFrom ggiraph geom_point_interactive girafe
#' @importFrom systemfonts system_fonts
#'
#' @return An interactive plot
#' @export
plot_distrib_type <- function(
    data,
    color = "#c1e1ec",
    title_font_size = 16,
    text_font_size = 11,
    font_family = "DIN Pro",
    language = c("fr", "de"),
    xmin = 1,
    xmax = 2,
    ymin = 1.3,
    ymax = 2
) {

  language <- match.arg(language)

  text_types <- trad_plot_distrib_type[[language]]$text_types
  title <- trad_plot_distrib_type[[language]]$title

  if (!(font_family %in% system_fonts()$family)) {
    family <- "Helvetica"
  }

  p <- ggplot(data, aes(x = x, y = y, size = size, color = color)) +
    geom_point_interactive(
      aes(tooltip = paste(type, "<br>", size)),
      shape = 21,
      fill = color,
      color = color
    ) +
    xlim(c(-0.75, 2.7)) +
    ylim(c(0.5, 2.7)) +
    scale_size_continuous(
      range = c(20, 50)
    ) +
    ggtitle(title) +
    theme_void() +
    theme(
      plot.title = element_text(
        family = font_family,
        size = title_font_size,
        hjust = 0.5
      ),
      legend.position = "none"
    )

  annotations <- data.frame(
    x = c(xmin, xmax, 0, 0),
    y = c(2.4, 2.4, ymax, ymin),
    label = c(
      text_types[["nutrition"]],
      text_types[["mental"]],
      text_types[["kids"]],
      text_types[["seniors"]]
    )
  )

  p <- p + geom_text(
    data = annotations,
    aes(x = x, y = y, label = label),
    family = font_family,
    size = text_font_size / 3,
    color = "black"
  )

  girafe(ggobj = p)

}
