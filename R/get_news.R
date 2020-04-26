#' Get news
#'
#' @param website a url of a new source in the format "news.ycombinator.com"
#'
#' @return a tibble containing the contents of the rss feed
#' @import tidyRSS
#' @export
#' @examples
#' get_news(website = "theguardian.com")

get_news <- function(website = "news.ycombinator.com") {

  # check if argument is character
  if (is.character(website)) {
    index <- rss_table$url == website
  } else {
    stop("'Website' should be character string.")
  }

  if (!any(index)) {
    stop(paste("Can't find website(s):", website, "in our database.
               Please check if these are valid website names.", sep = " "))
  }

  news_source <- rss_table$rss_endpoint[index]
  feed_entries <- tidyfeed(news_source) # this fails on some feeds
  return(feed_entries)
}
