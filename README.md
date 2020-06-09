
<!-- README.md is generated from README.Rmd. Please edit that file -->

# newscatcheR

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/newscatcheR)](https://cran.r-project.org/package=newscatcheR)
[![CRAN\_Download\_Badge](http://cranlogs.r-pkg.org/badges/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
[![CRAN\_Download\_Badge](http://cranlogs.r-pkg.org/badges/grand-total/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
![R-CMD-check](https://github.com/discindo/newscatcheR/workflows/R-CMD-check/badge.svg)
[![Codecov test
coverage](https://codecov.io/gh/discindo/newscatcheR/branch/master/graph/badge.svg)](https://codecov.io/gh/discindo/newscatcheR?branch=master)
<!-- [![Travis Build Status](https://travis-ci.com/discindo/newscatcheR.svg?branch=master)](https://travis-ci.com/discindo/newscatcheR) -->

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
#>  1 Hacker Ne… https://… Links for the i… 2020-06-09 18:23:03 Haiku R1/…
#>  2 Hacker Ne… https://… Links for the i… 2020-06-09 18:23:03 Thank HN:…
#>  3 Hacker Ne… https://… Links for the i… 2020-06-09 18:23:03 New inlin…
#>  4 Hacker Ne… https://… Links for the i… 2020-06-09 18:23:03 How Googl…
#>  5 Hacker Ne… https://… Links for the i… 2020-06-09 18:23:03 Quoteback…
#>  6 Hacker Ne… https://… Links for the i… 2020-06-09 18:23:03 Pharaoh R…
#>  7 Hacker Ne… https://… Links for the i… 2020-06-09 18:23:03 Vanta (YC…
#>  8 Hacker Ne… https://… Links for the i… 2020-06-09 18:23:03 Playing a…
#>  9 Hacker Ne… https://… Links for the i… 2020-06-09 18:23:03 SGAxe How…
#> 10 Hacker Ne… https://… Links for the i… 2020-06-09 18:23:03 Show HN: …
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
#>                                                            feed_entries$item_title
#> 1                                                 Haiku R1/beta2 has been released
#> 2                       Thank HN: My startup was born here and is now 10 years old
#> 3                             New inline assembly syntax available in Rust nightly
#> 4                                       How Google Meet's noise cancellation works
#> 5                                                       Quotebacks – Quote the Web
#> 6                                                         Pharaoh Ramesses VI Tomb
#> 7                   Vanta (YC) is hiring to get SoC 2 prep in as little as 30 days
#> 8                                 Playing around with the Fuchsia operating system
#> 9                                                  SGAxe How SGX Fails in Practice
#> 10  Show HN: I made an app for large group video calls where people shuffle around
#> 11              Britain has gone two months without burning coal to generate power
#> 12                                                     Show HN: Top, but for Nginx
#> 13                                                  Build your own PaaS in minutes
#> 14                                                            Growing Independence
#> 15                                   Honda's global operations hit by cyber-attack
#> 16           Receiving images of Earth from satellites with software defined radio
#> 17                        Can Negative Supply Shocks Cause Demand Shortages? [pdf]
#> 18                              Performance of Modern Java on Data-Heavy Workloads
#> 19                                        Defects are not the fault of programmers
#> 20                       Prisma 2.0 – Type-safe and auto-generated database client
#> 21                                      Microship.com: The Library of Technomadics
#> 22                                                    Learn to read Middle English
#> 23 Fremont Tesla workers tested positive for coronavirus days after plant reopened
#> 24                          Ask HN: Which tools made you a much better programmer?
#> 25                Pycopy – a minimalist and memory-efficient Python implementation
#> 26   Gravity: An embeddable programming language without any external dependencies
#> 27 Archaeologists have mapped a Roman city using advanced ground penetrating radar
#> 28                          Flintstoning your way around hard technical challenges
#> 29                                 Dark Basin Uncovering a Hack-for-Hire Operation
#> 30                             Why skyscraper architects always return to Art Deco
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
