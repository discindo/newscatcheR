#' News feed Shiny notification
#'
#' @description These are simple wrappers around \code{shiny::showNotification} and \code{shiny::withProgress}
#'              that fetch headlines from a news source and shows it as part
#'              of a Shiny notification. The intent is to provide informative or
#'              funny message as the user is interacting with the app or waiting for a computation to finish.
#'
#' @param text character, the content of the notification. To be combined with a random headline.
#'             For \code{news_notification} this is combined with the headline with HTML separated by a
#'             horizontal rule. For \code{news_progress}, this is passed onto the \code{message}
#'             argument of \code{shiny::withProgress}, while the headline is sent to the \code{detail} argument.
#' @param website character, news source to fetch headlines (see \code{?get_headlines})
#' @param rss_table data.frame, in case a custom RSS table is needed (default = \code{package_rss}) (see \code{?get_headlines})
#' @param ... additional arguments passed onto \code{shiny::showNotification} or \code{shiny::withProgress}
#'
#' @example /man/examples/example_news_notify.R
#'
#' @seealsocode{\link{shiny::showNotification()}} \code{\link{withProgress()}} \code{\link{get_headlines()}}
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

#' @rdname news_notification
#'
#' @export
news_progress <- function(text, website, rss_table = package_rss, ...) {
  headlines <-
    get_headlines(website = website, rss_table = rss_table)
  random_headline <-
    sample(x = headlines$`feed_entries$item_title`, size = 1)

  shiny::withProgress(message = text, detail = random_headline, ...)
}
