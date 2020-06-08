#' Get news
#'
#' @param website a url of a new source in the format "news.ycombinator.com"
#' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of webisites not in the included database.
#'
#' @return a tibble containing the contents of the rss feed
#'
#' @importFrom tidyRSS tidyfeed
#'
#' @export
#'
#' @examples
#' Sys.sleep(3) # adding a small time delay to avoid
#' # simultaneous posts to the API
#' get_news(website = "ycombinator.com")

get_news <- function(website = "ycombinator.com", rss_table = package_rss) {

  # check if argument is character
  if (is.character(website)) {
    index <- rss_table$clean_url == website
  } else {
    stop("'Website' should be character string.")
  }

  if (!any(index)) {
    stop(paste("Can't find website:", website, "in our database.
               Please check if this is a valid website name, or
               try to fetch the feed directly with tidyfeed()'.", sep = " "))
  }

  news_source <- rss_table$rss_url[index]
  feed_entries <- tidyfeed(news_source) # this fails on some feeds
  return(feed_entries)
}
