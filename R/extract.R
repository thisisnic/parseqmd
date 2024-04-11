extract_header_name <- function(header_obj){
  paste(header_obj[[3]]$c[!is.na(header_obj[[3]]$c)], collapse = " ")
}

extract_header_indent <- function(header_obj){
  header_obj[[1]]
}

extract_header_slug <- function(header_obj){
  header_obj[[2]][[1]]
}

extract_code <- function(code_obj){
  code_obj[[2]]$c[[1]][[2]]
}

extract_paragraph_text <- function(para_obj){
  para_obj$c[para_obj$t == "Space"] <- " "
  paste(unlist(para_obj$c), collapse = "")
}
