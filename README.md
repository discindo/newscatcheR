
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
#>  1 Hacker Ne… https://… Links for the i… 2020-06-05 12:26:26 Ask HN: H…
#>  2 Hacker Ne… https://… Links for the i… 2020-06-05 12:26:26 SimRefine…
#>  3 Hacker Ne… https://… Links for the i… 2020-06-05 12:26:26 Why Is th…
#>  4 Hacker Ne… https://… Links for the i… 2020-06-05 12:26:26 Mental We…
#>  5 Hacker Ne… https://… Links for the i… 2020-06-05 12:26:26 People tr…
#>  6 Hacker Ne… https://… Links for the i… 2020-06-05 12:26:26 First pho…
#>  7 Hacker Ne… https://… Links for the i… 2020-06-05 12:26:26 A History…
#>  8 Hacker Ne… https://… Links for the i… 2020-06-05 12:26:26 Germany, …
#>  9 Hacker Ne… https://… Links for the i… 2020-06-05 12:26:26 Julia as …
#> 10 Hacker Ne… https://… Links for the i… 2020-06-05 12:26:26 DeepFaceD…
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
#>                                                           feed_entries$item_title
#> 1                          Ask HN: How do I reach making $1-1.5k/mo in 13 months?
#> 2                                                           SimRefinery Recovered
#> 3                                     Why Is the Human Brain So Efficient? (2018)
#> 4                                                                   Mental Wealth
#> 5     People try to do right by each other, no matter the motivation, study finds
#> 6                                       First photo of HS2 tunnel boring machines
#> 7                                                      A History of Clojure [pdf]
#> 8            Germany, France launch Gaia-X platform in bid for ‘tech sovereignty’
#> 9                                                       Julia as a CLI Calculator
#> 10      DeepFaceDrawing Generates Photorealistic Portraits from Freehand Sketches
#> 11      Ask HN: Are my expectations on code quality and professionalism too high?
#> 12                                            The Go Compiler Needs to Be Smarter
#> 13                                                Unker Non-Linear Writing System
#> 14            Signal app downloads spike as US protesters seek message encryption
#> 15           Synthetic red blood cells mimic natural ones, and have new abilities
#> 16                                                   The Beauty of Unix Pipelines
#> 17                                                                  Kids and Time
#> 18                          555 timer teardown: inside the most popular IC (2016)
#> 19                                  Currents: Have Meaningful Discussions at Work
#> 20                                        Words that don't translate into English
#> 21                                                        Homoiconicity Revisited
#> 22                                               Containers from first principles
#> 23 Ask HN: Have you ever gone without a computer or phone for an extended period?
#> 24                                                    Why Sleep Deprivation Kills
#> 25                                                        macOS in QEMU in Docker
#> 26                                                         The Illiac IV Computer
#> 27                                  Cryo-electron microscopy breaks a key barrier
#> 28                                                          Emacs as Email Client
#> 29                        In a photo of a black hole, a possible key to mysteries
#> 30                         WeChat permabans account for using wrongthink password
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
