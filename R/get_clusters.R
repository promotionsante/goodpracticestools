#' Analyze data with MCA and HCPC
#'
#' @param data  Data frame. Prepared data about projects.
#'
#' @importFrom stringr str_replace_all
#' @importFrom tibble column_to_rownames
#' @importFrom dplyr select
#' @importFrom tidyselect starts_with
#' @importFrom FactoMineR MCA HCPC
#'
#' @return
#' @export
get_clusters <- function(
    data
) {

  # this modification is required to use {naileR}
  colnames(data) <- colnames(data) |>
    str_replace_all("_", ".")

  data_for_fa <- data |>
    select(
      fiche.d.informations.id,
      niveau,
      a.enfants.adolescents.nutrition.activite.physique,
      b.personnes.agees.nutrition.activite.physique,
      c.enfants.adolescents.sante.psychique,
      d.personnes.agees.sante.psychique,
      starts_with("theme"),
      starts_with("groupe.cible"),
      starts_with("setting")
    ) |>
    column_to_rownames(
      var = "fiche.d.informations.id"
    )

  res_mca <- MCA(
    data_for_fa,
    graph = FALSE
  )

  res_hcpc <- res_mca |>
    HCPC(
      nb.clust = -1,
      graph = FALSE
    )

  return(
    list(
      "res_mca" = res_mca,
      "res_hcpc" = res_hcpc,
      "data" = data
    )
  )

}
