#' Get headlines
#' A helper function to get just the headlines of the feed
#'
#' @param website a url of a new source in the format "news.ycombinator.com"
#'
#' @return a tibble containing the headlines contained in the feed
#' @export
#' @examples
#' Sys.sleep(3) # adding a small time delay to avoid
#' # simultaneous posts to the API
#' get_headlines(website = "news.ycombinator.com")

get_headlines <- function(website = "news.ycombinator.com") {
  feed_entries <- get_news(website)

  title_list <- as.data.frame(feed_entries$item_title)
  return(title_list)
}
