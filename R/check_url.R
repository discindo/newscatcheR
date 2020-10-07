#' Check URL
#' A helper function to verify user input before fetching the feed.
#'
#' @param website a url of a new source in the format "news.ycombinator.com"
#' @param rss_table a dataframe with urls and rss feeds in case you
#' need to construct your own out of websites not in the included database.
#' Be sure to have the same format as the included data. See `R/package_rss.R`
#' for details.
#'
#'

check_url <- function(website = "ycombinator.com", rss_table = package_rss) {

  # check if argument is character
  if (is.character(website)) {
    index <- rss_table$clean_url == website
  } else {
    stop("'Website' should be character string.")
  }

  if (!any(index)) {
    stop(
      paste(
        "Can't find the website:",
        website,
        "in our database. Please check if this is a valid website name, or try to fetch the feed directly with 'tydyrss::tidyfeed()'.",
        sep = " "
      )
    )
  }
}
