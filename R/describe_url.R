#' Describe URL
#'
#' @param website a url of a new source in the format "news.ycombinator.com"
#' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of webisites not in the included database.
#'
#' @return A character vector with topics.
#' @export
#'
#' @examples
#' describe_url(website = "ycombinator.com", rss_table = package_rss)

describe_url <- function(website = "ycombinator.com", rss_table = package_rss) {

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

  news_source <- rss_table[rss_table$clean_url == website,]

  news_source <- as.character(news_source$topic_unified)

  return(paste("Topics available for website", website, "are:\n", news_source))
}
