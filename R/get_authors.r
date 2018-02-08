#' Get Authors
#'
#' This function retrives the authors associated with a user's pocket content.
#' @param data large nested list returned from pocket
#'
#' @return dataframe of authors with one row per author and an "item id" field to join with the articles dataframe.
#' Converts all author names to Title Case
#'
#' @export
#'
#' @examples
#' authors <- get_authors(data)
#'
get_authors <- function(data) {
  # subset only authors
  authors_list <- data %>% purrr::map("authors")

  # flatten list
  flat <- purrr::flatten(authors_list)

  # return dataframe
  authors <- data.table::rbindlist(flat, fill=TRUE)

  # clean author names
  authors <- authors %>% mutate(name=stringr::str_to_title(name))

  return(authors)
}
