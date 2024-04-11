print_tree <- function(doc_json){
  blocks <- doc_json$blocks
  indent = 0
  for(i in seq_along(blocks$t)){
    t_item <- blocks$t[[i]]
    if(t_item == "Header"){
      obj <- blocks$c[[i]]
      header_content <- extract_header_name(obj)
      indent <- extract_header_indent(obj)
      cat(rep(" ", times = indent))
      cat(header_content, fill = TRUE)
    }
  }
}

print_table <- function(doc_json){

  blocks <- doc_json$blocks

  last_header = ""
  last_depth = 0

  item_list <- list()
  for(i in seq_along(blocks$t)){
    t_item <- blocks$t[[i]]

    name <- NA
    contents <- NA
    obj <- blocks$c[[i]]
    type = t_item

    if(t_item == "Header"){
      last_header <- extract_header_name(obj)
      last_depth <- extract_header_indent(obj)
      name <- last_header
      depth <- last_depth
      contents <- NA
    } else if(t_item == "Div"){
      name <- NA
      contents <- extract_code(obj)
      type = "Code"
    } else if(t_item == "Para"){
      name <- NA
      contents <- extract_paragraph_text(obj)
    } else if(t_item == "BulletList"){
      name <- NA
      contents <- NA
    } else if(t_item == "RawBlock"){
      name <- NA
      contents <- paste(obj, collapse = ":")
    }

    item_list[[i]] <- list(depth = last_depth, name = name, type = type, contents = contents)
  }

  data.frame(do.call(rbind, item_list))
}
