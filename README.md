
<!-- README.md is generated from README.Rmd. Please edit that file -->

# newscatcheR

<!-- badges: start -->

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/newscatcheR)](https://cran.r-project.org/package=newscatcheR)
[![CRAN\_Download\_Badge](http://cranlogs.r-pkg.org/badges/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
[![CRAN\_Download\_Badge](http://cranlogs.r-pkg.org/badges/grand-total/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)

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

You can install the released version of newscatcheR from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("newscatcheR")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("discindo/newscatcheR")
```

Or

``` r
# install.packages("devtools")
devtools::install_github("discindo/newscatcheR")
```

## Overview

`get_news(website)` returns the contents of a rss feed of a website.

``` r
library(newscatcheR)
# adding a small time delay to avoid simultaneous posts to the API
Sys.sleep(3)
get_news("news.ycombinator.com")
#> GET request successful. Parsing...
#> Warning: Predicate functions must be wrapped in `where()`.
#> 
#>   # Bad
#>   data %>% select(is.character)
#> 
#>   # Good
#>   data %>% select(where(is.character))
#> 
#> ℹ Please update your code.
#> This message is displayed once per session.
#> # A tibble: 30 x 10
#>    feed_title feed_link feed_description feed_pub_date       item_title
#>    <chr>      <chr>     <chr>            <dttm>              <chr>     
#>  1 Hacker Ne… https://… Links for the i… 2020-06-05 23:10:14 IBM Relea…
#>  2 Hacker Ne… https://… Links for the i… 2020-06-05 23:10:14 eBay is p…
#>  3 Hacker Ne… https://… Links for the i… 2020-06-05 23:10:14 Helium sh…
#>  4 Hacker Ne… https://… Links for the i… 2020-06-05 23:10:14 Peer-to-P…
#>  5 Hacker Ne… https://… Links for the i… 2020-06-05 23:10:14 Looking b…
#>  6 Hacker Ne… https://… Links for the i… 2020-06-05 23:10:14 Show HN: …
#>  7 Hacker Ne… https://… Links for the i… 2020-06-05 23:10:14 Special.f…
#>  8 Hacker Ne… https://… Links for the i… 2020-06-05 23:10:14 How to re…
#>  9 Hacker Ne… https://… Links for the i… 2020-06-05 23:10:14 Current u…
#> 10 Hacker Ne… https://… Links for the i… 2020-06-05 23:10:14 Humanitie…
#> # … with 20 more rows, and 5 more variables: item_link <chr>,
#> #   item_description <chr>, item_pub_date <dttm>, item_category <list>,
#> #   item_comments <chr>
```

`get_headlines(website)` returns just the headlines of the website’s rss
feed.

``` r
library(newscatcheR)
# adding a small time delay to avoid simultaneous posts to the API
Sys.sleep(3)  
get_headlines("news.ycombinator.com")
#> GET request successful. Parsing...
#>                                                       feed_entries$item_title
#> 1         IBM Releases Fully Homomorphic Encryption Toolkit for macOS and iOS
#> 2                             eBay is port scanning visitors to their website
#> 3                                 Helium shortage has ended, at least for now
#> 4                                     Peer-to-Peer Communications with WebRTC
#> 5                                            Looking back at how Signal works
#> 6            Show HN: Jqview, a simple native GUI for inspecting JSON with jq
#> 7                                                                Special.fish
#> 8                          How to receive a million packets per second (2015)
#> 9                   Current use of Linux in spacecraft flight software (2017)
#> 10              Humanities aren't a science and shouldn't be treated like one
#> 11                                            It is as if you were doing work
#> 12                                                             IoT on QuestDB
#> 13                               How we raised $3M for an open source project
#> 14 Four million parts, 30 countries: How an Airbus A380 comes together (2018)
#> 15                                                            Genetic Drawing
#> 16                 How to Write a Video Player in Less Than 1000 Lines (2015)
#> 17                                             JavaScript: The First 20 Years
#> 18                      QStringView Diaries: Zero-Allocation String Splitting
#> 19     Fitful nightly sleep linked to chronic inflammation, hardened arteries
#> 20    CMU’s ‘Penrose’ Turns Complex Math Notations into Illustrative Diagrams
#> 21                                          The Shareware Scene, Part 4: Doom
#> 22                       So You Want to Build an End-to-End Encrypted Web App
#> 23                                                     Maze Algorithms (2011)
#> 24              U.S. states lean toward breaking up Google's ad tech business
#> 25                                         Where Do People Draw Lines? (2008)
#> 26                                        Mathematics Anonymous Support Group
#> 27                    Show HN: Water Cooler – Always-available chat for teams
#> 28                                              There Are No Bugs, Just TODOs
#> 29                                                         Presentation Rules
#> 30                            Why the developers who use Rust love it so much
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
