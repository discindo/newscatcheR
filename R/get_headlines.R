#' Get headlines
#' A helper function to get just the headlines of the feed
#'
#' @param website a url of a new source in the format "news.ycombinator.com"
#' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of webisites not in the included database.
#' #Be sure to have the same format as the included data. See `R/package_rss.R`
#' #for details.
#'
#' @return a tibble containing the headlines contained in the feed
#'
#' @export
#'
#' @examples
#' Sys.sleep(3) # adding a small time delay to avoid
#' # simultaneous posts to the API
#' get_headlines(website = "ycombinator.com", rss_table = package_rss)

get_headlines <- function(website = "ycombinator.com", rss_table = package_rss) {
  feed_entries <- get_news(website, rss_table)

  title_list <- as.data.frame(feed_entries$item_title)
  return(title_list)
}
