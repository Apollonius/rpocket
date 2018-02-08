#' Get Articles
#'
#' This function takes the output from get_data and returns a dataframe of articles.
#' @param data large nested list returned from pocket
#'
#' @return dataframe of articles
#'
#' @export
#'
#' @examples
#' articles_df <- get_articles(data)
#'
get_articles <- function(data) {
  # create empty list
  articles_truncated <- list()

  # trucate each article at >1d nested lists
    # removes authors, image, images
  for (i in 1:length(data)) {
    current_article <- data[[i]][1:19]
    articles_truncated[[i]] <- current_article
  }

  # return dataframe
  articles <- data.table::rbindlist(articles_truncated)
  return(articles)
}
