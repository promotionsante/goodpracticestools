# Mandatory columns
vec_mandatory_col <- c(
  "Fiche d\u2019informations ID",
  "Nom",
  "Description",
  "Niveau",
  "I", "II", "III",
  "A", "B", "C", "D",
  "Th\u00e8me",
  "Groupe cible",
  "Setting"
)

# plot_distrib_type
trad_plot_distrib_type <- list(
  fr = list(
    text_types = list(
      "nutrition" = "Nutrition et activit\u00e9 physique",
      "mental" = "Sant\u00e9 psychique",
      "kids" = "Enfants/adolescents",
      "seniors" = "Personnes \u00e2g\u00e9es"
    ),
    title = "R\u00e9partition des types de projets"
  ),
  de = list(
    text_types = list(
      "nutrition" = "Ern\u00e4hrung und k\u00f6rperliche Aktivit\u00e4t",
      "mental" = "Psychische Gesundheit",
      "kids" = "Kinder/Jugendliche",
      "seniors" = "\u00c4ltere Menschen"
    ),
    title = "Verteilung der Projekttypen"
  )
)

# plot_distrib_level
trad_plot_distrib_level <- list(
  fr = list(
    text_types = list(
      "intervention" = "Intervention",
      "public information" = "Information au public",
      "networking" = "Mise en r\u00e9seau",
      "policy" = "Policy"
    ),
    title = "R\u00e9partition des niveaux\navec lesquels les objectifs peuvent \u00eatre atteints"
  ),
  de = list(
    text_types = list(
      "intervention" = "Intervention",
      "public information" = "\u00d6ffentlichkeitsarbeit",
      "networking" = "Vernetzung",
      "policy" = "Policy"
    ),
    title = "Verteilung der Ebenen, mit\ndenen die Ziele erreicht werden k\u00f6nnen"
  )
)


