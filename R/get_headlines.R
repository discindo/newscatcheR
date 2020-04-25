#' Get headlines
#' A helper function to get just the headlines of the feed
#'
#' @param website a url of a new source in the format "news.ycombinator.com"
#'
#' @return a tibble containing the headlines contained in the feed
#' @export
#' @examples
#' get_headlines("news.ycombinator.com")

get_headlines <- function(website = "news.ycombinator.com") {

  feed_entries <- get_news(website)

  title_list <- feed_entries %>%
    select(item_title)

  return(title_list)
}
