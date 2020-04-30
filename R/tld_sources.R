#' tld_sources
#' A helper function to explore news sources by country (or other TLD)
#'
#' @param tld a country code top level domain in the format ".de"
#'
#' @return a tibble containing the contents of the rss feed
#' @export
#' @examples
#' tld_sources(tld = "de")

tld_sources <- function(tld = NULL) {
  if (is.null(tld)) {
    rss_table <- newscatcheR::rss_table
  } else {
    rss_table <- newscatcheR::rss_table
    regex <- paste0(tld, "$")
    index <- grepl(regex, rss_table$url)
    rss_table <- rss_table[index, ]
  }
  if (is.data.frame(rss_table) && nrow(rss_table) == 0) {
    stop(paste("Can't find the TLD", tld, "in our database.
               Please check if this is a valid TLD.", sep = " "))
  } else {
    return(rss_table) }

}
