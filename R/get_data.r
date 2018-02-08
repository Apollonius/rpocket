#' Get Data
#'
#' This function retrives a user's pocket data and returns a nested list.
#' @param consumer_key pocket provided consumer key
#' @param access_token pocket provided access token
#' @param since unix timestamp to return items modified since date, no value calls everything
#'
#' @return a nested list
#' @export
#'
#' @examples
#'
get_data <- function(consumer_key, access_token, since="") {
  # build api call
  api_url <- "https://getpocket.com/v3/get/"
  url <- paste(api_url, "?access_token=", access_token,
               "&consumer_key=", consumer_key,
               "&detailType=complete&state=all&conentType=article&sort=newest&since=", since,
               sep="")

  # parse JSON into list
  result <- jsonlite::fromJSON(txt = url, simplifyDataFrame = FALSE, simplifyVector = FALSE)
  articles_list <- result$list

  return(articles_list)
}
