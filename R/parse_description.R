#' Parse the description of the project by using spaCy
#'
#' @param data Data frame. Raw data about projects.
#' @param nb_min_word Integer. Minimum number of occurences to keep a word.
#'
#' @importFrom dplyr mutate select left_join
#' @importFrom stringr str_replace_all str_squish
#' @importFrom tm removeWords stopwords
#' @importFrom spacyr spacy_initialize spacy_parse spacy_finalize
#' @importFrom purrr map
#' @importFrom FactoMineR textual
#' @importFrom tibble rownames_to_column as_tibble
#'
#' @return Data frame with parsed description
parse_description <- function(
    data,
    nb_min_word = 10
  ) {

  # keep only id and description
  data_id_desc <- data |>
    select(
      fiche_d_informations_id,
      description
    )

  # tolower and remove stopwords
  data_tolower_with_no_stopwords <- data_id_desc |>
    mutate(
      description = str_replace_all(
        tolower(description), "[[:punct:]]|<e2><97><8f>|[0-9]", " "
      )
    ) |>
    mutate(
      description = removeWords(
        description,
        words = c(stopwords("fr"), "l ", "les", "a ")
      )
    )

  # parse description with lemmatization
  spacy_initialize(model = "fr_core_news_sm")

  data_tolower_with_no_stopwords$description <- data_tolower_with_no_stopwords$description |>
    map(
      ~ spacy_parse(
        .x,
        lemma = TRUE
      )$lemma |>
        paste(
          collapse = " "
        ) |>
        str_squish()
    ) |>
    unlist()

  spacy_finalize()

  # calculates the number of occurence of each words
  res_textual_description <- textual(
    data_tolower_with_no_stopwords,
    num.text = 2,
    contingence.by = 1,
    sep.word = " "
  )

  data_words_description_selection <- res_textual_description$cont.table[, apply(res_textual_description$cont.table, MARGIN = 2, FUN = sum) >= nb_min_word] |>
    as.data.frame()

  colnames(data_words_description_selection) <- paste0("desc_", colnames(data_words_description_selection))

  data_words_description_selection <- data_words_description_selection |>
    rownames_to_column(
      var = "fiche_d_informations_id"
    ) |>
    as_tibble()

  # add the results in the original dataset and delete the previous column "description"
  data_desc_ok <- left_join(
    data |> select(- description),
    data_words_description_selection,
    by = "fiche_d_informations_id"
  )

  return(data_desc_ok)

}
