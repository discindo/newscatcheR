# newscatcheR
Programmatically collect normalized news from (almost) any website using R

newscatcheR is an R clone of the python package [newscatcher](https://github.com/kotartemiy/newscatcher).  

The package provides a daset of news sites and their rss feeds, and two funcions that work as a wrapper around [tidyRSS](https://github.com/RobertMyles/tidyRSS) to fetch the feed from a given site. It also provides a function to check the dataset for news sources per top level domain.

It can be installed from Github with:

`devtools::install_github("discindo/newscatcheR")`

## Overview

`get_news(website)` returns the contents of a rss feed of a website. 

`get_news("news.ycombinator.com")`
```
#> GET request successful. Parsing...
#> # A tibble: 30 x 9
#>    feed_title feed_link feed_description feed_pub_date       item_title
#>    <chr>      <chr>     <chr>            <dttm>              <chr>     
#>  1 Hacker Ne… https://… Links for the i… 2020-04-26 15:19:34 Teleforki…
#>  2 Hacker Ne… https://… Links for the i… 2020-04-26 15:19:34 Creating …
#>  3 Hacker Ne… https://… Links for the i… 2020-04-26 15:19:34 Decrypt W…
#>  4 Hacker Ne… https://… Links for the i… 2020-04-26 15:19:34 Why my bo…
#>  5 Hacker Ne… https://… Links for the i… 2020-04-26 15:19:34 How I Pho…
#>  6 Hacker Ne… https://… Links for the i… 2020-04-26 15:19:34 Teenagers…
#>  7 Hacker Ne… https://… Links for the i… 2020-04-26 15:19:34 BR Shetty…
#>  8 Hacker Ne… https://… Links for the i… 2020-04-26 15:19:34 Show HN: …
#>  9 Hacker Ne… https://… Links for the i… 2020-04-26 15:19:34 My NixOS …
#> 10 Hacker Ne… https://… Links for the i… 2020-04-26 15:19:34 A hypothe…
#> # … with 20 more rows, and 4 more variables: item_link <chr>,
#> #   item_description <chr>, item_pub_date <dttm>, item_comments <chr>
```

`get_headlines(website)` returns just the headlines of the website's rss feed.

` get_headlines("news.ycombinator.com")`
```
#> GET request successful. Parsing...
#>                                                     feed_entries$item_title
#> 1                           Teleforking a Process onto a Different Computer
#> 2            Creating ad hoc microphone arrays from personal devices (2019)
#> 3                                    Decrypt WhatsApp encrypted media files
#> 4                             Why my book can be downloaded for free (2014)
#> 5                    How I Photograph the Milky Way with Medium Format Film
#> 6                   Teenagers are better behaved and less hedonistic (2018)
#> 7                             BR Shetty: The rise and fall of a billionaire
#> 8     Show HN: Kanmail – An email client that functions like a kanban board
#> 9                                                     My NixOS Desktop Flow
#> 10       A hypothesis that self-face-touching subserves self-smelling [pdf]
```

`tld_sources(tld)` returns rows from the provided dataset of news sites with the given top level domain

`tld_sources("it")`

```
# A tibble: 10 x 2
   url            rss_endpoint                     
   <chr>          <chr>                            
 1 ansa.it        http://www.ansa.it/web/ansait_we…
 2 thinkandbuild… https://www.thinkandbuild.it/fee…
 3 wasproject.it  http://www.wasproject.it/w/en/bl…
 4 corriere.it    http://www.corriere.it/rss/homep…
 5 gazzetta.it    http://www.gazzetta.it/rss/calci…
 6 ilfattoquotid… http://www.ilfattoquotidiano.it/…
 7 lastampa.it    http://www.lastampa.it/redazione…
 8 punto-informa… http://punto-informatico.it/fade…
 9 repubblica.it  http://www.repubblica.it/rss/hom…
10 tgcom.mediase… http://www.tgcom.mediaset.it/rss…
```
## Use case

This package can be convenient if you need to fetch news from various websites for further analysis and you don't want to search manually for the URL of their RSS feeds.

Assuming we have the news sites we want to follow:

`sites = c("bbc.com", "spiegel.de", "washingtonpost.com")`

We can get a list of data frames with:

 `lapply(sites, get_news)`
