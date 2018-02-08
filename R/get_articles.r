#' Get Articles
#'
#' This function takes the output from get_data and returns a dataframe of articles.
#' @param data large nested list returned from pocket
#'
#' @return dataframe of articles
#' Cleaning includes:
#'  - unix dates to datetimes
#'  - adding organization field which does its best to get the organization from the resolved_url field
#'  - word_count field as integer
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

  # clean up dates
  articles <- articles %>%
    dplyr::mutate(date_added=as.POSIXct(as.integer(time_added),origin = "1970-01-01",tz = "GMT"),
                  date_updated=as.POSIXct(as.integer(time_updated),origin = "1970-01-01",tz = "GMT"),
                  date_read=as.POSIXct(as.integer(time_read),origin = "1970-01-01",tz = "GMT"),
                  date_favorited=as.POSIXct(as.integer(time_favorited),origin = "1970-01-01",tz = "GMT"))

  # get organization website domain - strip out everyting around domain
  articles <- articles %>% dplyr::mutate(organization=gsub(".*//|/.*|www.|.com|blog.|blogs.|.org|.co.uk|medium.|news.|apps.|.de|story.|.co|.net|highline.",
                                                           "", resolved_url),
                                         word_count = as.integer(word_count))

  return(articles)
}
