#' Filter URLs
#' Filter URLs in the provided database based on topic, country and language
#'
#' @param topic the topic of the feed see `show_topics()` for more info.
#' @param country the country of origin of the feed using two capital
#' letters, for example "US". See `show_countries()` for more info.
#' @param language the language of the content of the feed using two
#' lowercase letters, for example "en". See `show_languages()` for more info.
#' @param rss_table a dataframe with urls and rss feeds in case you
#' need to construct your own out of websites not in the included database.
#' #Be sure to have the same format as the included data. See `R/package_rss.R`
#' #for details.
#'
#' @return a tibble filtered according to the given parameters
#' @export
#'
#' @examples
#' filter_urls(topic = "tech", country = "US", language = "en")
filter_urls <-
  function(topic = NULL,
           country = NULL,
           language = NULL,
           rss_table = package_rss) {
    work_table <- rss_table

    if (!is.null(topic)) {
      stopifnot("'topic' should be character string." = is.character(topic))
      work_table <- work_table[work_table$topic_unified == topic,]
      if (nrow(work_table) == 0) {
        if (topic %in% rss_table$topic_unified) {
          message(
            "The topic is in the database, but has no entries in combination with the other filters."
          )
        } else {
          message(
            "Can't find the requested topic in our database. Choose some of the available topics: ",
            paste0(show_topics(), collapse = ", "),
            "."
          )
        }
        return(invisible(NULL))
      }
    }

    if (!is.null(country)) {
      stopifnot("'country' should be character string." = is.character(country))
      work_table <- work_table[work_table$clean_country == country, ]
      if (nrow(work_table) == 0) {
        if (country %in% rss_table$clean_country) {
          message(
            "The country is in the database, but has no entries in combination with the other filters."
          )
        } else {
          message(
            "Can't find the requested country in our database. Choose some of the available countries: ",
            paste0(show_countries(), collapse = ", "),
            "."
          )
        }
        return(invisible(NULL))
      }
    }

    if (!is.null(language)) {
      stopifnot("'language' should be character string." = is.character(language))
      work_table <- work_table[work_table$language == language, ]
      if (nrow(work_table) == 0) {
        if (language %in% rss_table$language) {
          message(
            "The language is in the database, but has no entries in combination with the other filters."
          )
        } else {
          message(
            "Can't find the requested language in our database. Choose some of the available languages: ",
            paste0(show_languages(), collapse = ", "),
            "."
          )
        }
        return(invisible(NULL))
      }
    }

    return(work_table)
  }
