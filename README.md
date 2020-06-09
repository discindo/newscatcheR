
<!-- README.md is generated from README.Rmd. Please edit that file -->

# newscatcheR

<!-- badges: start -->

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/newscatcheR)](https://cran.r-project.org/package=newscatcheR)
[![CRAN\_Download\_Badge](http://cranlogs.r-pkg.org/badges/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
[![CRAN\_Download\_Badge](http://cranlogs.r-pkg.org/badges/grand-total/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
![R-CMD-check](https://github.com/discindo/newscatcheR/workflows/R-CMD-check/badge.svg)
[![Codecov test
coverage](https://codecov.io/gh/discindo/newscatcheR/branch/master/graph/badge.svg)](https://codecov.io/gh/discindo/newscatcheR?branch=master)

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
#>  1 Hacker Ne… https://… Links for the i… 2020-06-09 09:28:48 Build you…
#>  2 Hacker Ne… https://… Links for the i… 2020-06-09 09:28:48 GnuTLS: T…
#>  3 Hacker Ne… https://… Links for the i… 2020-06-09 09:28:48 Container…
#>  4 Hacker Ne… https://… Links for the i… 2020-06-09 09:28:48 Formal Sy…
#>  5 Hacker Ne… https://… Links for the i… 2020-06-09 09:28:48 Faster th…
#>  6 Hacker Ne… https://… Links for the i… 2020-06-09 09:28:48 How to Re…
#>  7 Hacker Ne… https://… Links for the i… 2020-06-09 09:28:48 Metafont …
#>  8 Hacker Ne… https://… Links for the i… 2020-06-09 09:28:48 Pycopy – …
#>  9 Hacker Ne… https://… Links for the i… 2020-06-09 09:28:48 Potential…
#> 10 Hacker Ne… https://… Links for the i… 2020-06-09 09:28:48 Text for …
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
#> 1                                                   Build your own PaaS in minutes
#> 2       GnuTLS: TLS 1.3 session resumption works without master key, allowing MITM
#> 3      Container technologies at Coinbase: Why Kubernetes is not part of our stack
#> 4                                                        Formal Systems in Biology
#> 5                               Faster than radix sort: Kirkpatrick-Reisch sorting
#> 6                         How to Reverse-Engineer a Satellite TV Smart Card (2008)
#> 7                                                                  Metafont (1984)
#> 8                 Pycopy – a minimalist and memory-efficient Python implementation
#> 9          Potential organized fraud in ACM/IEEE computer architecture conferences
#> 10                      Text for Proofing Fonts: A Farewell to the Quick Brown Fox
#> 11               Repetition and Learning – misconceptions about effective studying
#> 12                      How the Magic: The Gathering Color Wheel Explains Humanity
#> 13    IBM no longer offers general purpose facial recognition or analysis software
#> 14         Show HN: A library to add a command promp (and telnet) to your programs
#> 15                        Coordination Problems: What It Takes to Change the World
#> 16     Israeli Startups Unique Engine Bringing Power to a Remote Philippine Island
#> 17 Wuhan hospital traffic, search engine data indicate virus activity in Fall 2019
#> 18                            Show HN: Watch what files any Linux process accesses
#> 19                Bill Thurston's answer to “What's a mathematician to do?” (2010)
#> 20                              The Al Jaffee / Mad Magazine Fold-In Effect in CSS
#> 21                            Questions Answered by Donald E. Knuth (2001) [video]
#> 22                                 Rich-markdown-editor: react Dropbox Paper clone
#> 23                               The “Majority Illusion” in Social Networks (2016)
#> 24                                                 Formalizing Text Editors in Coq
#> 25                                               “Pain Is the Only School-Teacher”
#> 26  Amazon sues former AWS marketing VP Brian Hall after he takes Google Cloud job
#> 27 Tesorio is hiring Managers and Engineers. Join our distributed engineering team
#> 28                     The path toward mastery: How to become an expert in a field
#> 29                       Apple Plans to Announce Move to Its Own Mac Chips at WWDC
#> 30                                        Transcribed police scanners in real-time
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
