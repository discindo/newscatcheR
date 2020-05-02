
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

You can install the released version of newscatcheR from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("newscatcheR")
```

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
#>  1 Hacker Ne… https://… Links for the i… 2020-05-02 18:51:23 Medium-ha…
#>  2 Hacker Ne… https://… Links for the i… 2020-05-02 18:51:23 CTO of Se…
#>  3 Hacker Ne… https://… Links for the i… 2020-05-02 18:51:23 The Sequo…
#>  4 Hacker Ne… https://… Links for the i… 2020-05-02 18:51:23 Building …
#>  5 Hacker Ne… https://… Links for the i… 2020-05-02 18:51:23 My First …
#>  6 Hacker Ne… https://… Links for the i… 2020-05-02 18:51:23 UCF resea…
#>  7 Hacker Ne… https://… Links for the i… 2020-05-02 18:51:23 I shipped…
#>  8 Hacker Ne… https://… Links for the i… 2020-05-02 18:51:23 Concurren…
#>  9 Hacker Ne… https://… Links for the i… 2020-05-02 18:51:23 Build you…
#> 10 Hacker Ne… https://… Links for the i… 2020-05-02 18:51:23 History o…
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
#>                                                            feed_entries$item_title
#> 1                                              Medium-hard SQL interview questions
#> 2                           CTO of Segment on how to sell a B2B Enterprise product
#> 3                                                     The Sequoia Guide to Pricing
#> 4                   Building a real-time patient monitoring system with Go and Vue
#> 5                                         My First Year as a Freelance AI Engineer
#> 6              UCF researchers develop groundbreaking new rocket-propulsion system
#> 7        I shipped a word processor that formatted the hard drive every 1024 saves
#> 8                                                           Concurrent Hash Tables
#> 9                                              Build your own WebAssembly Compiler
#> 10                                                                 History of Logo
#> 11                     Show HN: Rendering One Million Datapoints with D3 and WebGL
#> 12                                                                        Pg-Basic
#> 13     Scientists Waited Two and a Half Years to See Whether Bacteria Can Eat Rock
#> 14                                                             The Design Squiggle
#> 15                         Safe Network. Secure P2P app system implemented in Rust
#> 16                                                 Static Sites with Elasticsearch
#> 17                                                The power of admitting ignorance
#> 18                            India orders coronavirus tracing app for all workers
#> 19                         Witchcraft and Wizardry – RPG game created in Minecraft
#> 20                       Ubuntu 20.04 LTS’ snap obsession has snapped me off of it
#> 21 Show HN: DiscoverAli – A weekly newsletter of inexpensive, interesting products
#> 22                                      What Is a Sustainable Path to Open Access?
#> 23                                                                    Time on Unix
#> 24                            Bandcamp is waiving fees today in support of artists
#> 25    Judge Orders FCC To Hand Over IP Addresses Linked To Net Neutrality Comments
#> 26                                 Notion encourages busy-work and I’m tired of it
#> 27         ‘Breathable’ Electronics Pave the Way for More Functional Wearable Tech
#> 28            Jerry (YC S17) Is Hiring Full Stack Engineers (Toronto, SF Bay Area)
#> 29                             The World Is Still Producing More Oil Than It Needs
#> 30        What Happens Next? Covid-19 Futures, Explained with Playable Simulations
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
