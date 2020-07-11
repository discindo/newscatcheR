#' Filter URLs
#' Filter URLS in the provided database.
#'
#' @param topic the topic of the feed see `show_topics()` for more.
#' @param country the country of origin of the feed using two capital
#' #letters, for example "US". See `show_countries()` for more.
#' @param language the language of the content of the feed using two
#' #lowercase letters, for example "en". See `show_languages()` for more.
#' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of websites not in the included database.
#'
#' @return a tibble filtered according to the given parameters
#' @export
#'
#' @examples
#' filter_urls(topic = "tech", country = "US", language = "en")
filter_urls <- function(topic = NULL, country = NULL, language = NULL, rss_table = package_rss) {

  if (!is.null(topic)) {
    stopifnot("'topic' should be character string." = is.character(topic))
    rss_table <- rss_table[rss_table$topic_unified == topic, ]
    if (nrow(rss_table) == 0) {
      message("Can't find the requested topic in our database. Choose some of the available topics: ",
              paste0(show_topics(), collapse = ", "), ".")
      }
  }

  if (!is.null(country)) {
    stopifnot("'country' should be character string." = is.character(country))
    rss_table <- rss_table[rss_table$clean_country == country, ]
    if (nrow(rss_table) == 0) {
      message("Can't find the requested country in our database. Choose some of the available countries: ",
              paste0(show_countries(), collapse = ", "), ".")
      }
  }

  if (!is.null(language)) {
    stopifnot("'language' should be character string." = is.character(language))
    rss_table <- rss_table[rss_table$language == language, ]
    if (nrow(rss_table) == 0) {
      message("Can't find the requested language in our database. Choose some of the available languages: ",
              paste0(show_language(), collapse = ", "), ".")
      }
  }
  return(rss_table)
}
