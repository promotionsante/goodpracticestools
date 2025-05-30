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
    title = "R\u00e9partition des types de projets",
    caption = "Note : Certains projets ne sont associ\u00e9s \u00e0 aucun type,\ntandis que d\'autres sont associ\u00e9s \u00e0 plusieurs types."
  ),
  de = list(
    text_types = list(
      "nutrition" = "Ern\u00e4hrung und k\u00f6rperliche Aktivit\u00e4t",
      "mental" = "Psychische Gesundheit",
      "kids" = "Kinder/Jugendliche",
      "seniors" = "\u00c4ltere Menschen"
    ),
    title = "Verteilung der Projekttypen",
    caption = "Hinweis: Einige Projekte sind keinem Typ zugeordnet,\nw\u00e4hrend andere mehreren Typen zugeordnet sind."
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

# show_raw_data
vec_large_col <- list(
  fr = c(
    "Description",
    "Principaux enseignements tir\u00e9s de la mise en \u0153uvre",
    "Impact"
  ),
  de = c(
    "Beschreibung",
    "Wichtige Erkenntnisse aus der Umsetzung",
    "Wirkung"
  )
)

vec_medium_col <- list(
  fr = c(
    "Forces particuliers",
    "Informations compl\u00e9mentaires",
    "Groupes particuli\u00e8rement vuln\u00e9rables",
    "Priorit\u00e9s",
    "Multiplicateur-trice-s",
    "Port\u00e9e",
    "Setting"
  ),
  de = c(
    "Besondere St\u00e4rken",
    "Weiterf\u00fchrende Informationen",
    "Besonders vulnerable Gruppen",
    "Schwerpunkte",
    "Multiplikatoren_innen",
    "Reichweite",
    "Setting"
  )
)

# plot_clusters
trad_plot_clusters <- list(
  fr = list(
    text = "Plus de d\u00e9tails dans \'Explorer en d\u00e9tails les projets\'",
    title = "Clusters de projets"
  ),
  de = list(
    text = "Mehr Details unter \'Projekte im Detail erkunden\'",
    title = "Projektcluster"
  )
)
