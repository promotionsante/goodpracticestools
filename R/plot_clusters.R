#' Plot the clusters on the MCA factorial plan
#'
#' @param res_analysis List. Object obtained from the data analysis.
#' @param axes Character. Axes to be plotted.
#' @param colors Character. Colors of the clusters.
#' @param title_font_size Integer. Font size for the title.
#' @param text_font_size Integer. Font size for the texts.
#' @param font_family Character.
#' @param language Character. "fr" or "de".
#' @param data_raw_de Data frame. Raw German data.
#'
#' @importFrom tibble rownames_to_column
#' @importFrom dplyr left_join select
#' @importFrom ggplot2 ggplot aes geom_vline geom_hline scale_color_manual ggtitle theme_minimal labs
#' @importFrom ggiraph geom_point_interactive girafe
#' @importFrom systemfonts system_fonts
#'
#' @return An interactive plot
#' @export
plot_clusters <- function(
    res_analysis,
    axes = c(1, 2),
    colors = c("#c1e1ec", "#f08c00", "#ced4da", "#fcc2d7", "#99e9f2"),
    title_font_size = 16,
    text_font_size = 7,
    font_family = "DIN Pro",
    language = c("fr", "de"),
    data_raw_de = NULL
) {

  language <- match.arg(language)

  title <- trad_plot_clusters[[language]]$title
  text <- trad_plot_clusters[[language]]$text

  data_coord <- res_analysis$res_mca$ind$coord[, axes] |>
    as.data.frame() |>
    rownames_to_column(
      var = "fiche.d.informations.id"
    )

  colnames(data_coord)[2:3] <- c("x", "y")

  data_coord_with_clust <- data_coord |>
    left_join(
      res_analysis$res_hcpc$data.clust |>
        as.data.frame() |>
        rownames_to_column(
          var = "fiche.d.informations.id"
        ) |>
        select(
          fiche.d.informations.id, clust
        ),
      by = "fiche.d.informations.id"
    ) |>
    left_join(
      res_analysis$data |>
        select(
          fiche.d.informations.id, nom
        ),
      by = "fiche.d.informations.id"
    )

  if (language == "de") {

    data_coord_with_clust <- data_coord_with_clust |>
      select(-nom) |>
      left_join(
        data_raw_de |>
          select(
            `Steckbrief ID`, Titel
          ) |>
          rename(
            nom = Titel
          ),
        by = c(
          "fiche.d.informations.id" = "Steckbrief ID"
        )
      )

  }

  p <- ggplot(data = data_coord_with_clust) +
    aes(
      x = x,
      y = y,
      color = clust
    ) +
    geom_vline(
      xintercept = 0,
      color = "#e9ecef"
    ) +
    geom_hline(
      yintercept = 0,
      color = "#e9ecef"
    ) +
    geom_point_interactive(
      aes(
        tooltip = paste(
          fiche.d.informations.id, "<br>",
          nom, "<br>",
          paste0("<i><span style='font-size:", text_font_size + 3, "px;'>"), text, "</span></i>"
        )
      )
    ) +
    labs(
      color = "cluster"
    ) +
    scale_color_manual(
      values = colors
    ) +
    ggtitle(title) +
    theme_minimal() +
    theme(
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      axis.title = element_blank(),
      axis.text = element_blank()
    )

  if (font_family %in% system_fonts()$family) {

    p <- p +
      theme(
        plot.title = element_text(
          family = font_family,
          size = title_font_size,
          hjust = 0.5
        )
      )

  } else {

    p <- p +
      theme(
        plot.title = element_text(
          size = title_font_size,
          hjust = 0.5
        )
      )

  }

  girafe(ggobj = p)

}
