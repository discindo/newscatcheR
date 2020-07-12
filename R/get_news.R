#' Get news
#' Get the contents of a rss feed
#'
#' @param website a url of a new source in the format "news.ycombinator.com"
#' @param topic the topic of the feed, by default it is NULL which means it
#' #will fetch the "main" feed. topics are 'tech', 'news', 'business', 'science',
#' #'finance', 'food', 'politics', 'economics', 'travel', 'entertainment',
#' #'music', 'sport', 'world', but not all site have all topics.
#' #use `describe_url("website")` to check for available feeds.
#' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of websites not in the included database.
#' #Be sure to have the same format as the included data. See `R/package_rss.R`
#' #for details.
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
#' get_news(website = "ycombinator.com", rss_table = package_rss)

get_news <- function(website = "ycombinator.com", topic = NULL, rss_table = package_rss) {

  check_url(website, rss_table)

  news_source <- rss_table[rss_table$clean_url == website,]

  if (is.null(topic)) {
    news_source <- news_source[news_source$main == 1,]
  } else if (!any(topic %in% news_source$topic_unified)) {
    message(
      paste(
        "Website:",
        website,
        "does not have a feed for the specified topic.",
        sep = " "
      )
    )
    describe_url("bbc.com")

    return(invisible(NULL))

  } else {
    news_source <- news_source[news_source$topic_unified == topic,]
  }

  feed_entries <- tidyfeed(news_source$rss_url)
  return(feed_entries)
}
