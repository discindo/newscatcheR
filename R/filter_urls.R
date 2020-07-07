#' Filter URLs
#' FIlter URLS in the provided database.
#'
#' @param topic the topic of the feed see `show_topics()` for more.
#' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of webisites not in the included database.
#' @param country the country of the feed see `show_countries()` for more.
#' @param language the language of the feed see `show_languages()` for more.
#'
#' @return
#' @export
#'
#' @examples
filter_urls <- function(topic = NULL, country = NULL, language = NULL, rss_table = package_rss) {

  if (!is.null(topic)) {
    rss_table <- rss_table[rss_table$topic_unified == topic,]
  }

  if (!is.null(country)) {
    rss_table <- rss_table[rss_table$clean_country == country,]
  }

  if (!is.null(language)) {
    rss_table <- rss_table[rss_table$language == language,]
  }

  return(rss_table)

}
