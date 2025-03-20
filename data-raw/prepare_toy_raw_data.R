## code to prepare `data_raw_fr` dataset goes here

data_raw_fr <- readxl::read_excel("data-raw/data_projects_fr_no_contact.xlsx")

usethis::use_data(
  data_raw_fr,
  overwrite = TRUE
)

checkhelper::use_data_doc(
  "data_raw_fr"
)

## code to prepare `data_raw_fr` dataset goes here

data_raw_fr <- readxl::read_excel("data-raw/data_projects_fr_no_contact.xlsx")

data_fr <- data_raw_fr |>
  prepare_data()

usethis::use_data(
  data_fr,
  overwrite = TRUE
)

checkhelper::use_data_doc(
  "data_fr"
)

## code to prepare `data_raw_de` dataset goes here

data_raw_de <- readxl::read_excel("data-raw/data_projects_de_no_contact.xlsx")

usethis::use_data(
  data_raw_de,
  overwrite = TRUE
)

checkhelper::use_data_doc(
  "data_raw_de"
)

## code to prepare `res_interpret_clusters` object goes here
data("data_fr")

res_analysis <- get_clusters(
  data = data_fr
)

res_interpret_clusters <- interpret_clusters(
  res_analysis = res_analysis
)

usethis::use_data(
  res_interpret_clusters,
  overwrite = TRUE
)

checkhelper::use_data_doc(
  "res_interpret_clusters"
)
