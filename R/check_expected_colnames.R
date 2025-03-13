#' Check that mandatory columns are present in the dataset
#'
#' @param data Data frame. Raw data about projects.
#' @param lang Character. Language, either "fr" or "de".
#'
#' @importFrom glue glue
#' @return An error if some colnames are absent.
check_expected_colnames <- function(
    data,
    lang = c("fr", "de")
    ) {

  lang <- match.arg(lang)

  if (lang == "fr") {

    vec_expected_colnames <- c(
      "Fiche d\xE2\x80\x99informations ID",
      "Nom",
      "Description",
      "Niveau",
      "I", "II", "III",
      "A", "B", "C", "D",
      "Th\xC3\xA8me",
      "Groupe cible",
      "Setting"
    )

  }

  if (lang == "de") {

    vec_expected_colnames <- c(
      "Steckbrief ID",
      "Titel",
      "Beschreibung",
      "Ebene",
      "I", "II", "III",
      "A", "B", "C", "D",
      "Thema",
      "Zielgruppe",
      "Setting"
    )

  }

  if (!all(vec_expected_colnames %in% colnames(data))) {
    stop(
      glue(
        "The dataset must contain -at least- the columns {paste(vec_expected_colnames, collapse = ', ')}"
      )
    )
  }

}
