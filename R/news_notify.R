#' News feed Shiny notification
#'
#' @description This is a simple wrapper around \code{shiny::showNotification}
#'              that fetches headlines from a news source and shows it as part
#'              of a Shiny notification. The intent is to provide informative or
#'              funny message as the user is interacting with the app.
#'
#' @param text character, the content of the notification. To be combined with a random headline.
#' @param website character, news source to fetch headlines
#' @param rss_table data.frame, in case a custom RSS table is needed (default = \code{package_rss})
#' @param ... additional arguments passed onto \code{shiny::showNotification}
#'
#' @example /man/examples/example_news_notify.R
#'
#' @export

news_notification <-
  function(text, website, rss_table = package_rss, ...) {
    headlines <-
      get_headlines(website = website, rss_table = rss_table)
    random_headline <-
      sample(x = headlines$`feed_entries$item_title`, size = 1)

    shiny::showNotification(ui = shiny::HTML(paste(text, "<hr>", random_headline)), ...)
  }
