#' newscatcheR: Programmatically collect normalized news from (almost) any website using R
#'
#' Two functions that work as a wrapper around tidyRSS can be used to fetch the feed from a given website.
#' Two additional functions can be used to conveniently browse the websites dataset.
#'
#' @section newscatcheR functions are:
#' get_news(website) returns the contents of a rss feed of a website.
#' get_headlines(website) returns just the headlines of the website’s rss feed.
#' describe_url(website) returns the topics of a given web site.
#' filter_urls(topic, country, language ) can be used to browse the dataset by topic, country or language.
#' See more in the vignette.
#'
#' @docType package
#' @name newscatcheR
NULL

#' @importFrom tidyRSS tidyfeed
NULL

#' @importFrom utils globalVariables
utils::globalVariables("package_rss")
