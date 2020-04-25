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
  if (is.character(website) == FALSE) {
    stop("Website should be character vector.")

    # check if it exists in dataframe and inform if it doesn't
  } else if (!all(website %in% rss_table$url)) {
    faulty <- website[!website %in% rss_table$url]
    stop(paste("Can't find website(s):", faulty, "in our database. Please check if these are valid website names.", sep=" "))

    # return if it does
  } else {
    news_source <- rss_table$rss_endpoint[rss_table$url %in% website]
    feed_entries <- tidyfeed(news_source) # this fails on some feeds
  }
  return(feed_entries)
}
