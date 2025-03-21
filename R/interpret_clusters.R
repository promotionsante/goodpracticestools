#' Interpret the clusters of projects by using a Large Language Model
#'
#' @param res_analysis List. Results of the analysis (MCA + clustering).
#'
#' @importFrom dplyr left_join select
#' @importFrom tibble rownames_to_column
#' @importFrom stringr str_replace_all
#' @importFrom NaileR nail_catdes
#' @importFrom ollamar generate pull
#'
#' @return A list with the interpretation of the clusters of projects.
#' @export
interpret_clusters <- function(
    res_analysis
) {

  # prepare the dataset
  data_for_llm <- res_analysis$data |>
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
    )

  colnames(data_for_llm) <- gsub("desc.", "", colnames(data_for_llm))

  # define the introduction for the llm
  intro_llm <- c("Dans cette étude, nous avons
collecté plusieurs informations sur des projets
pour la prévention dans le domaine des soins. Cela inclut
promouvoir une alimentation équilibrée, une activité physique adéquate, et
une meilleure santé psychique des enfants, des jeunes adultes et des personnes
âgées. Pour cela, différents niveaux d'actions peuvent être mis en place :
interventions, policy, mise en réseau et information du public. Au niveau
intervention, des projets sont mis en oeuvre pour mobiliser les spécialistes
et les personnes de références. Au niveau policy, des mesures et des directives
réglementaires sont conçues. Au niveau mise en réseau, les cantons définissent
des mesures de coopération avec différents acteurs du canton. Au niveau
information au public, les groupes cibles sont sont sensibilisées et informées.
Après avoir analysé les données, les projets ont
été groupés en groupes homogènes de projets (clusters).") |>
    str_replace_all("\n", " ")

  # define the request for the llm
  request_llm <- c("La desccription des projets est fournie dans la section
'Donn\u00e9es'. Sur la base de ces informations :
1. Fourni une description de chaque groupe de projets, sous une forme littérale;
2. Donne un nom à ce groupe
Structure ta réponse comme cela:
Cluster X : [Ta recommandation de nom ici]
[Ton résumé des caractéristiques du groupe ici];
Évite le terme 'Promotion' dans tes recommandations de noms et privilégie plutôt le terme de 'Pr\u00e9vention de la sant\u00e9'.
Si le groupe de projets est dédié à un type de publics (enfants, adolescents, jeunes adultes, personnes âgées),
fais le figurer dans le nom du groupe à chaque fois. Ne me renvoie que la description des clusters.
Supprime toute phrase d'introduction ou de conclusion, je veux directement le premier Cluster.") |>
    str_replace_all("\n", " ")

  # get the prompt
  res_prompt_llm <- nail_catdes(
    dataset = data_for_llm,
    num.var = which(colnames(data_for_llm) == "clust"),
    introduction = intro_llm,
    request = request_llm,
    proba = 0.05,
    isolate.groups = FALSE,
    drop.negative = TRUE,
    generate = FALSE
  )

  res_prompt_llm <- res_prompt_llm |>
    str_replace_all("# Task", "# T\u00e2che") |>
    str_replace_all("# Data", "# Donn\u00e9es") |>
    str_replace_all("## Group", "## Cluster de projets") |>
    str_replace_all("Observations in this group are \\*more\\* likely to be associated with the following response categories. In this output, the name of the variable precedes the category that characterises our observations by its strong association:", "Les projets de ce cluster sont \\*plus\\* susceptibles d\'\u00eatre associ\u00e9s aux caract\u00e9ristiques suivantes. Dans cette sortie, le nom de la variable pr\u00e9c\u00e8de la cat\u00e9gorie qui caract\u00e9rise nos observations par sa forte association :") |>
    str_replace_all("Observations in this group have quite \\*high\\* values for the following variables:", "Les projets de ce cluster sont \\*plus\\* susceptibles de contenir dans leur description les mots suivants:")

  # run the llm in FR
  pull(
    name = "llama3.1"
  )

  res_desc_llm_fr <- generate(
    model = "llama3.1",
    prompt = res_prompt_llm,
    output = "text"
  )

  res_desc_llm_fr <- sub(
    "^.*\n\n\\*\\*Cluster 1",
    "**Cluster 1",
    res_desc_llm_fr
  )

  # run the llm in DE
  res_desc_llm_de <- generate(
    model = "llama3.1",
    prompt = paste0("Peux-tu me traduire tout le texte suivant en allemand en gardant la m\u00eame structure et en supprimant toute phrase d'introduction ou de conclusion. Je veux juste les descriptions des clusters. Pas de phrase en français au début ou à la fin. Dans ta traduction, utilise le terme 'cluster' en allemand, et pas 'kluster'. Voici le texte à traduire :", res_desc_llm_fr),
    output = "text"
  )

  res_desc_llm_de <- sub(
    "Kluster",
    "Cluster",
    res_desc_llm_de
  )

  res_desc_llm_de <- sub(
    "^.*\n\n\\*\\*Cluster 1",
    "**Cluster 1",
    res_desc_llm_de
  )

  return(
    list(
      intro_llm = intro_llm,
      request_llm = request_llm,
      res_prompt_llm = res_prompt_llm,
      res_desc_llm_fr = res_desc_llm_fr,
      res_desc_llm_de = res_desc_llm_de
    )
  )

}
