get_articles <- function(articles_list) {
  # create empty list
  articles_truncated <- list()

  # trucate each article at >1d nested lists
    # removes authors, image, images
  for (i in 1:length(articles_list)) {
    current_article <- articles_list[[i]][1:19]
    articles_truncated[[i]] <- current_article
  }

  # return dataframe
  articles <- data.table::rbindlist(articles_truncated)
  return(articles)
}
