#' tld_sources
#' A helper function to explore news sources by country (or other TLD)
#'
#' @param tld a country code top level domain in the format ".de"
#' @param rss_table a dataframe with urls and rss feeds in case you
#' #need to construct your own out of webisites not in the included database.
#'
#' @return a tibble containing the contents of the rss feed
#'
#' @export
#'
#' @examples
#' tld_sources(tld = "de", rss_table = package_rss)

tld_sources <- function(tld = NULL, rss_table = package_rss) {
  if (!is.null(tld)) {
    regex <- paste0(tld, "$")
    index <- grepl(regex, rss_table$clean_url)
    rss_table <- rss_table[index, ]
  }
  if (is.data.frame(rss_table) && nrow(rss_table) == 0) {
    stop(paste("Can't find the TLD", tld, "in our database.
               Please check if this is a valid TLD.", sep = " "))
  } else {
    return(rss_table) }

}
