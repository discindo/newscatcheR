# Filter helpers
# Short functions for exploring the RSS feeds data


#' Show topics
#' Show all topics in the database.
#'
#' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of websites not in the included database.
#' #Be sure to have the same format as the included data. See `R/package_rss.R`
#' #for details.
#'
#' @return a character vector of available topics

show_topics <- function(rss_table = package_rss) {
  return(unique(rss_table$topic_unified))
}



#' Show countries
#' Show all countries in the database.
#'
#' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of websites not in the included database.
#' #Be sure to have the same format as the included data. See `R/package_rss.R`
#' #for details.
#' @return a character vector of available countries

show_countries <- function(rss_table = package_rss) {
  return(unique(rss_table$clean_country))
}


#' Show languages
#' Show all languages in the database.
#'
#' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of websites not in the included database.#' #Be sure to have the same format as the included data. See `R/package_rss.R`
#' #for details.
#'
#' @return a character vector of available languages

show_languages <- function(rss_table = package_rss) {
  return(unique(rss_table$language))
}
