#' Get news
#'
#' @param website a url of a new source in the format "news.ycombinator.com"
#'
#' @return a tibble containing the contents of the rss feed
#' @import tidyverse
#' @import tidyRSS
#' @export
#' @examples
#' datapath <- system.file("example-data/my-dataset.csv", package = "newscatcheR")
#' example_data <- readr::read_csv(datapath, col_names = c("url", "rss"))
#' get_news("news.ycombinator.com")

get_news <- function(website = "news.ycombinator.com") {

  # check if argument is character
  if (is.character(website) == FALSE) {
    print("Website should be character vector.")

    # check if it exists in dataframe and inform if it doesn't
  } else if (is.element(website, rss_table$url) == FALSE) {
    print("We don't have that news source.")

    # return if it does
  } else {
    news_source <- rss_table %>%
      filter(url == website) %>%
      pull(rss_endpoint)

    feed_entries <- tidyfeed(news_source) # this fails on some feeds

  }

  return(feed_entries)

}
