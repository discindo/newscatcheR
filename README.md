
<!-- README.md is generated from README.Rmd. Please edit that file -->

# newscatcheR

<!-- badges: start -->

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/newscatcheR)](https://cran.r-project.org/package=newscatcheR)
[![CRAN_Download_Badge](https://cranlogs.r-pkg.org/badges/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
[![CRAN_Download_Badge](https://cranlogs.r-pkg.org/badges/grand-total/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
[![R-CMD-check](https://github.com/discindo/newscatcheR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/discindo/newscatcheR/actions/workflows/R-CMD-check.yaml)
![pkgdown](https://github.com/discindo/newscatcheR/workflows/pkgdown/badge.svg)
<!-- [![codecov](https://codecov.io/gh/discindo/newscatcheR/graph/badge.svg?token=u3BlKDT8b3)](https://codecov.io/gh/discindo/newscatcheR)>

<!-- badges: end -->

Programmatically collect normalized news from (almost) any website using
R

newscatcheR is an R clone of the python package
[newscatcher](https://github.com/kotartemiy/newscatcher).

The package provides a dataset of news sites and their rss feeds,
together with some characteristics of the websites such as the topic,
country or language of the website, and few functions explore and access
the feeds from `R`.

Two functions that work as a wrapper around
[tidyRSS](https://github.com/RobertMyles/tidyRSS) can be used to fetch
the feed from a given website. Two additional functions can be used to
conveniently browse the websites dataset.

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
#> Warning: package 'newscatcheR' was built under R version 4.3.1
# adding a small time delay to avoid simultaneous posts to the API
Sys.sleep(3)
get_news("ycombinator.com")
#> GET request successful. Parsing...
#> # A tibble: 30 × 10
#>    feed_title  feed_link         feed_description feed_pub_date       item_title
#>    <chr>       <chr>             <chr>            <dttm>              <chr>     
#>  1 Hacker News https://news.yco… Links for the i… 2023-09-20 06:44:42 OpenTF re…
#>  2 Hacker News https://news.yco… Links for the i… 2023-09-20 06:44:42 FAA autho…
#>  3 Hacker News https://news.yco… Links for the i… 2023-09-20 06:44:42 Can’t sen…
#>  4 Hacker News https://news.yco… Links for the i… 2023-09-20 06:44:42 What will…
#>  5 Hacker News https://news.yco… Links for the i… 2023-09-20 06:44:42 Add extra…
#>  6 Hacker News https://news.yco… Links for the i… 2023-09-20 06:44:42 100 Parki…
#>  7 Hacker News https://news.yco… Links for the i… 2023-09-20 06:44:42 My trip t…
#>  8 Hacker News https://news.yco… Links for the i… 2023-09-20 06:44:42 A simple …
#>  9 Hacker News https://news.yco… Links for the i… 2023-09-20 06:44:42 Aldous Hu…
#> 10 Hacker News https://news.yco… Links for the i… 2023-09-20 06:44:42 SillycoVa…
#> # ℹ 20 more rows
#> # ℹ 5 more variables: item_link <chr>, item_description <chr>,
#> #   item_pub_date <dttm>, item_category <list>, item_comments <chr>
```

`get_headlines(website)` returns just the headlines of the website’s rss
feed.

``` r
library(newscatcheR)
# adding a small time delay to avoid simultaneous posts to the API
Sys.sleep(3)  
get_headlines("ycombinator.com")
#> GET request successful. Parsing...
#>                                                          feed_entries$item_title
#> 1                                              OpenTF renames itself to OpenTofu
#> 2             FAA authorizes Zipline to deliver commercial packages using drones
#> 3                                    Can’t send email more than 500 miles (2002)
#> 4            What will LLM-powered software look like in the medium-term future?
#> 5                        Add extra stuff to a “standard” encoding? Sure, why not
#> 6                                                     100 Parking Tickets (2004)
#> 7                      My trip to the Communication and Laptop Museum in Estonia
#> 8                                             A simple web server written in Awk
#> 9                                                Aldous Huxley's Deep Reflection
#> 10                                 SillycoValley: Write Code, Build Your Startup
#> 11                                                   Fixing for loops in Go 1.22
#> 12 Q-Transformer: Scalable Reinforcement Learning via Autoregressive Q-Functions
#> 13                                         First automatic JPEG-XL cloud service
#> 14                                                          Getting into Pinball
#> 15                     A small community of unofficial Apple technicians in Cuba
#> 16                                                       Chonky Menu Re-Creation
#> 17                           Show HN: Liz – Collaborative Lisp coding on Discord
#> 18                          RabbitMQ vs. Kafka – An Architect’s Dilemma (Part 1)
#> 19                A closer look at BookCorpus, a key dataset in machine learning
#> 20             Snowden leak: Cavium networking hardware may contain NSA backdoor
#> 21             Show HN: Cheq UPI – India's first UPI payments app for foreigners
#> 22   Etleap (YC W13) Is Hiring a Software Engineer (London – OR – San Francisco)
#> 23 Show HN: A reference implementation of Turing's paper “On Computable Numbers”
#> 24                                               Stability without stressing out
#> 25                                                             Secretions (1992)
#> 26                   Show HN: Symphony – Use GPT-4 to call functions in sequence
#> 27                                                          Writing HTML by hand
#> 28         Smashing the state machine: the true potential of web race conditions
#> 29 Pink diamonds erupted to Earth’s surface after early supercontinent’s breakup
#> 30                              Permazen: a different persistence layer for Java
```

`describe_url(website)` returns the topics of a given web site.

``` r
describe_url("bbc.com")
#> Topics available for website bbc.com: business, news, science, travel.
```

`filter_urls(topic, country, language )` can be used to browse the
dataset by topic, country or language.

``` r
filter_urls(topic = "tech", country = "IT", language = "it")
#> # A tibble: 5 × 7
#>   clean_url       language topic_unified main  clean_country rss_url  GlobalRank
#>   <chr>           <chr>    <chr>         <chr> <chr>         <chr>    <chr>     
#> 1 repubblica.it   it       tech          None  IT            http://… 1086      
#> 2 lastampa.it     it       tech          None  IT            http://… 2413      
#> 3 ilsole24ore.com it       tech          None  IT            http://… 2681      
#> 4 corriere.it     it       tech          None  IT            http://… 1328      
#> 5 ansa.it         it       tech          None  IT            http://… 2248
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
