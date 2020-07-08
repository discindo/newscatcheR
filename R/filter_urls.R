#' Filter URLs
#' Filter URLS in the provided database.
#'
#' @param topic the topic of the feed see `show_topics()` for more.
#' @param country the country of origin of the feed using two capital
#' #letters, for example "US". See `show_countries()` for more.
#' @param language the language of the content of the feed using two
#' #lowercase letters, for example "en". See `show_languages()` for more.
#' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of webisites not in the included database.
#'
#' @return a tibble filtered according to the given parameters
#' @export
#'
#' @examples
#' filter_urls(topic = "tech", country = "US", language = "en")
filter_urls <- function(topic = NULL, country = NULL, language = NULL, rss_table = package_rss) {

  if (!is.character(topic)) {
    stop("'topic' should be character string.")
  } else if (!any(show_topics() == topic) && !is.null(topic)) {
    stop(
      paste(
        "Can't find topic:",
        topic,
        "in our database. See available topic with `show_topics()`.",
        sep = " "
      )
    )
  } else {
    rss_table <- rss_table[rss_table$topic_unified == topic,]
  }

  if (!is.character(country)) {
    stop("'country' should be character string.")
  } else if (!any(show_countries() == country) && !is.null(country)) {
    stop(
      paste(
        "Can't find country:",
        country,
        "in our database. See available countries with `show_countries()`.",
        sep = " "
      )
    )
  } else {
    rss_table <- rss_table[rss_table$clean_country == country,]
  }


  if (!is.character(language)) {
    stop("'language' should be character string.")
  } else if (!any(show_languages() == language) && !is.null(language)) {
    stop(
      paste(
        "Can't find language:",
        language,
        "in our database. See availale languages with `show_languages()`.",
        sep = " "
      )
    )
  } else {
    rss_table <- rss_table[rss_table$clean_country == country,]
  }

  return(rss_table)

}
