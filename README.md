
<!-- README.md is generated from README.Rmd. Please edit that file -->

# newscatcheR

<!-- badges: start -->

<!-- badges: end -->

Programmatically collect normalized news from (almost) any website using
R

newscatcheR is an R clone of the python package
[newscatcher](https://github.com/kotartemiy/newscatcher).

The package provides a dataset of news sites and their rss feeds, and
two functions that work as a wrapper around
[tidyRSS](https://github.com/RobertMyles/tidyRSS) to fetch the feed from
a given site. It also provides a function to check the dataset for news
sources per top level domain.

## Installation

~~You can install the released version of newscatcheR from
[CRAN](https://CRAN.R-project.org) with:~~

\~\~`r ~~install.packages("newscatcheR") ~~`

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("discindo/newscatcheR")
```

## Overview

`get_news(website)` returns the contents of a rss feed of a website.

``` r
library(newscatcheR)
get_news("news.ycombinator.com")
#> GET request successful. Parsing...
#> # A tibble: 30 x 9
#>    feed_title feed_link feed_description feed_pub_date       item_title
#>    <chr>      <chr>     <chr>            <dttm>              <chr>     
#>  1 Hacker Ne… https://… Links for the i… 2020-04-29 16:49:58 Show HN: …
#>  2 Hacker Ne… https://… Links for the i… 2020-04-29 16:49:58 Lyft lays…
#>  3 Hacker Ne… https://… Links for the i… 2020-04-29 16:49:58 Why Segme…
#>  4 Hacker Ne… https://… Links for the i… 2020-04-29 16:49:58 Free data…
#>  5 Hacker Ne… https://… Links for the i… 2020-04-29 16:49:58 A simple …
#>  6 Hacker Ne… https://… Links for the i… 2020-04-29 16:49:58 Boeing, E…
#>  7 Hacker Ne… https://… Links for the i… 2020-04-29 16:49:58 Good writ…
#>  8 Hacker Ne… https://… Links for the i… 2020-04-29 16:49:58 Building …
#>  9 Hacker Ne… https://… Links for the i… 2020-04-29 16:49:58 I Sing th…
#> 10 Hacker Ne… https://… Links for the i… 2020-04-29 16:49:58 Ennui: Ho…
#> # … with 20 more rows, and 4 more variables: item_link <chr>,
#> #   item_description <chr>, item_pub_date <dttm>, item_comments <chr>
```

`get_headlines(website)` returns just the headlines of the website’s rss
feed.

``` r
library(newscatcheR)
# adding a small time delay to avoid simultaneous posts to the API
Sys.sleep(1) # 
get_headlines("news.ycombinator.com")
#> GET request successful. Parsing...
#>                                                             feed_entries$item_title
#> 1                   Show HN: Insomnia Designer, an API Designer Powered by Insomnia
#> 2                           Lyft lays off 17% of workforce, furloughs hundreds more
#> 3                                               Why Segment Went Back to a Monolith
#> 4                        Free dataset of VCs investing in seed and Series A+ rounds
#> 5          A simple macOS tool to instantly deploying GUIs for commands and scripts
#> 6                              Boeing, Expecting a Long Slump, Will Cut 16,000 Jobs
#> 7                                              Good writing is a business advantage
#> 8                       Building a WireGuard Jail with the FreeBSD's Standard Tools
#> 9                                                      I Sing the Airplane Electric
#> 10                                           Ennui: How to Overcome Chronic Boredom
#> 11          A Glass Nightmare: Cleaning Up the Cold War’s Nuclear Legacy at Hanford
#> 12                            Software Folklore – A collection of weird bug stories
#> 13              Show HN: Midas, a Streaming Anomaly Detector. Now Implemented in Go
#> 14                                                       Hunting a Linux kernel bug
#> 15 DataJet – Fully managed Apache NiFi as a service. Visual Data flows without code
#> 16                              Boiling the machines when they needed to just chill
#> 17                                                      More Descent, Less Gradient
#> 18                          Show HN: A sound-effect chatroom for meeting engagement
#> 19                                                                 Anger Management
#> 20           Vidgear – A complete, cross-platform video processing Python framework
#> 21                                                    68 Bits of Unsolicited Advice
#> 22                  U.S. Economy Shrinks at 4.8% Pace, Signaling Start of Recession
#> 23 German government to bail Lufthansa out of bankruptcy with nearly $10B state aid
#> 24                         Pachyderm Is Hiring React Devs, Go Engineers, K8s DevOps
#> 25        Do you need more than a Front end and Firebase education to ship product?
#> 26                                        Opting in to Preview Builds with AWS ALBs
#> 27                                                     I could do that in a weekend
#> 28                                                 Fat pointers in C using libcello
#> 29                                                         De-Googling: My Progress
#> 30                                                     LibreOffice ReleaseNotes 7.0
```

`tld_sources(tld)` returns rows from the provided dataset of news sites
with the given top level domain

``` r
library(newscatcheR)
tld_sources("it")
#> # A tibble: 10 x 2
#>    url                  rss_endpoint                                      
#>    <chr>                <chr>                                             
#>  1 ansa.it              http://www.ansa.it/web/ansait_web_rss_homepage.xml
#>  2 thinkandbuild.it     https://www.thinkandbuild.it/feed/                
#>  3 wasproject.it        http://www.wasproject.it/w/en/blog-2/feed         
#>  4 corriere.it          http://www.corriere.it/rss/homepage.xml           
#>  5 gazzetta.it          http://www.gazzetta.it/rss/calcio.xml             
#>  6 ilfattoquotidiano.it http://www.ilfattoquotidiano.it/feed/             
#>  7 lastampa.it          http://www.lastampa.it/redazione/rss_home.xml     
#>  8 punto-informatico.it http://punto-informatico.it/fader/pixml.xml       
#>  9 repubblica.it        http://www.repubblica.it/rss/homepage/rss2.0.xml  
#> 10 tgcom.mediaset.it    http://www.tgcom.mediaset.it/rss/cronaca.xml
```

## Use Case

This package can be convenient if you need to fetch news from various
websites for further analysis and you don’t want to search manually for
the URL of their RSS feeds.

Assuming we have the news sites we want to follow:

``` r
sites = c("bbc.com", "spiegel.de", "washingtonpost.com")
```

We can get a list of data frames with:

``` r
library(newscatcheR)
lapply(sites, get_news)
```
