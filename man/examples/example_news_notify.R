\dontrun{
library(dplyr)

# First we prepare a rss table for `The Onion`
# as this is not part of the package_rss table
onion_rss <- tibble::tibble(
  clean_url = "theonion.com",
  language = "en",
  topic_unified = "entertainment",
  main = 1,
  clean_country = "US",
  rss_url = "https://www.theonion.com/rss",
  GlobalRank = NA
)

# Make sure we can get The Onion's RSS:
suppressWarnings(get_headlines(website = "theonion.com", rss_table = onion_rss))

# Random The Onion headline
random_headline <- . %>%
  get_headlines(website = .$clean_url, rss_table = .) %>%
  pull(`feed_entries$item_title`) %>%
  sample(size = 1)

random_headline(onion_rss)
}

# Now we are ready to launch a Shiny app
# with notifications spiced up with The Onion headlines
# (for fun!)

if (interactive()) {
  library(shiny)

  ui <- fluidPage(
    actionButton(inputId = "go", label = "Go")
  )

  server <- function(input, output, session) {
    observeEvent(input$go, {
      news_notification(text = "From The Onion:",
                        website = "theonion.com",
                        rss_table = onion_rss,
                        type = "warning")
    })
  }

  shinyApp(ui, server)
}

# And a progress notification


if (interactive()) {
  library(shiny)

  ui <- fluidPage(
    actionButton(inputId = "go", label = "Go")
  )

  server <- function(input, output, session) {
    observeEvent(input$go, {
      news_progress(text = "From The Onion:",
                    website = "theonion.com",
                    rss_table = onion_rss,
                    expr = Sys.sleep(10))
    })
  }

  shinyApp(ui, server)
}
