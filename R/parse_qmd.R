parse_qmd <- function(file){

  filename <- basename(file)
  type <- strsplit(filename, "\\.")[[1]][2]
  name <- strsplit(filename, "\\.")[[1]][1]

  if(!tolower(type) %in% c(".rmd", "qmd")){
    stop(paste("Unrecognised file type: ", type, collapse = ""))
  }

  td <- tempfile()
  dir.create(td)
  file.copy(file, file.path(td, filename))
  writeLines(text = "execute:\n  eval: false\n  include: true", file.path(td, "_quarto.yml"))

  quarto::quarto_render(file.path(td, filename), output_format = "json", quiet = TRUE)

  jsonlite::fromJSON(file.path(td, paste0(name, ".json")))
}
