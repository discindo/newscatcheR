# Filter helpers
# Short functions for exploring the RSS feeds data


#' Show topics
#' Show all topics in the database.
#'
#' #' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of websites not in the included database.
#'
#' @return a character vector of available topics
#' @export

show_topics <- function(rss_table = package_rss) {
  return(unique(rss_table$topic_unified))
}



#' Show countries
#' Show all countries in the database.
#'
#' @param topic the topic of the feed see `show_topics()` for more.
#' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of webisites not in the included database.
#' @param country the country of the feed see `show_countries()` for more.
#' @param language the language of the feed see `show_languages()` for more.
#'
#' @return a character vector of available countries
#' @export


show_countries <- function(rss_table = package_rss) {
  return(unique(rss_table$clean_country))
}


#' Show languages
#' Show all languages in the database.
#'
#' @param topic the topic of the feed see `show_topics()` for more.
#' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of webisites not in the included database.
#' @param country the country of the feed see `show_countries()` for more.
#' @param language the language of the feed see `show_languages()` for more.
#'
#' @return a character vector of available languages
#' @export

show_languages <- function(rss_table = package_rss) {
  return(unique(rss_table$language))
}
