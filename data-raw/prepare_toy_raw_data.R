## code to prepare `data_raw_fr` dataset goes here

data_raw_fr <- readxl::read_excel("data-raw/data_projects_fr_no_contact.xlsx")

usethis::use_data(
  data_raw_fr,
  overwrite = TRUE
)

checkhelper::use_data_doc(
  "data_raw_fr"
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
