#' Get headlines
#' A helper function to get just the headlines of the feed
#'
#' @param website a url of a new source in the format "news.ycombinator.com"
#' @param topic the topic of the feed, by default it is NULL which means it
#' will fetch the "main" feed. topics are 'tech', 'news', 'business', 'science',
#' 'finance', 'food', 'politics', 'economics', 'travel', 'entertainment',
#' 'music', 'sport', 'world', but not all site have all topics.
#' use \code{describe_url("website")} to check for available feeds.
#' @param rss_table a dataframe with urls and rss feeds in case you
#' need to construct your own out of websites not in the included database.
#' Be sure to have the same format as the included data. See \code{package_rss}
#' for details.
#'
#' @return a tibble containing the headlines contained in the feed
#'
#' @export
#'
#' @examples
#' \dontrun{
#' Sys.sleep(3) # adding a small time delay to avoid
#' # simultaneous posts to the API
#' get_headlines(website = "ycombinator.com", rss_table = package_rss)
#' }

get_headlines <- function(website = "ycombinator.com", topic = NULL, rss_table = package_rss) {
  feed_entries <- get_news(website, topic, rss_table)

  title_list <- as.data.frame(feed_entries$item_title)
  return(title_list)
}
