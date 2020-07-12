#' Describe URL
#'
#' @param website a url of a new source in the format "news.ycombinator.com"
#' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of websites not in the included database.
#' #Be sure to have the same format as the included data. See `R/package_rss.R`
#' #for details.
#'
#' @return A character vector with topics.
#' @export
#'
#' @examples
#' describe_url(website = "ycombinator.com", rss_table = package_rss)

describe_url <- function(website = "ycombinator.com", rss_table = package_rss) {

  check_url(website, rss_table)

  news_source <- rss_table[rss_table$clean_url == website,]

  news_source <- sort(news_source$topic_unified)

  message(paste0(
    "Topics available for website ",
    website,
    " are: ",
    paste0(news_source, collapse = ", "), "."
  ))

}

