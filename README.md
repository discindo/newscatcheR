
<!-- README.md is generated from README.Rmd. Please edit that file -->

# newscatcheR <img src="man/figures/logo.svg" align="right" height="139" alt="" />

<!-- badges: start -->

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/newscatcheR)](https://cran.r-project.org/package=newscatcheR)
[![CRAN_Download_Badge](https://cranlogs.r-pkg.org/badges/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
[![CRAN_Download_Badge](https://cranlogs.r-pkg.org/badges/grand-total/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
[![R-CMD-check](https://github.com/discindo/newscatcheR/actions/workflows/R-CMD-check.yml/badge.svg)](https://github.com/discindo/newscatcheR/actions/workflows/R-CMD-check.yml)
[![pkgdown](https://github.com/discindo/newscatcheR/actions/workflows/pkgdown.yml/badge.svg?branch=main)](https://github.com/discindo/newscatcheR/actions/workflows/pkgdown.yml)
[![codecov](https://codecov.io/gh/discindo/newscatcheR/graph/badge.svg?token=u3BlKDT8b3)](https://codecov.io/gh/discindo/newscatcheR)
[![newscatcheR status
badge](https://discindo.r-universe.dev/newscatcheR/badges/version)](https://discindo.r-universe.dev/newscatcheR)

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

Install newscatcheR from:

### CRAN

``` r
install.packages("newscatcheR")
```

### R-Universe

``` r
install.packages('newscatcheR', repos = c('https://discindo.r-universe.dev'))
```

### GitHub

``` r
pak::pak('discindo/newscatcheR')
```

## Overview

`get_news(website)` returns the contents of a rss feed of a website.

``` r
library(newscatcheR)
# adding a small time delay to avoid simultaneous posts to the API
Sys.sleep(3)
get_news("ycombinator.com")
#> GET request successful. Parsing...
#> # A tibble: 30 × 10
#>    feed_title  feed_link         feed_description feed_pub_date       item_title
#>    <chr>       <chr>             <chr>            <dttm>              <chr>     
#>  1 Hacker News https://news.yco… Links for the i… 2026-10-16 17:08:38 90% of US…
#>  2 Hacker News https://news.yco… Links for the i… 2026-10-16 17:08:38 Apple ML …
#>  3 Hacker News https://news.yco… Links for the i… 2026-10-16 17:08:38 Big Fish:…
#>  4 Hacker News https://news.yco… Links for the i… 2026-10-16 17:08:38 Show HN: …
#>  5 Hacker News https://news.yco… Links for the i… 2026-10-16 17:08:38 I Love So…
#>  6 Hacker News https://news.yco… Links for the i… 2026-10-16 17:08:38 What on E…
#>  7 Hacker News https://news.yco… Links for the i… 2026-10-16 17:08:38 JPEG XL v…
#>  8 Hacker News https://news.yco… Links for the i… 2026-10-16 17:08:38 Piramidal…
#>  9 Hacker News https://news.yco… Links for the i… 2026-10-16 17:08:38 Stolen Re…
#> 10 Hacker News https://news.yco… Links for the i… 2026-10-16 17:08:38 Tesla Roa…
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
#>                                                              feed_entries$item_title
#> 1       90% of US working hours are spent on tasks not covered well by AI benchmarks
#> 2                          Apple ML Research: Muse Spark Open with MLX on Mac Studio
#> 3                           Big Fish: Exploiting a 37-Year-Old Kernel Bug in OpenBSD
#> 4                                            Show HN: Gemini 4 Argon plays StarCraft
#> 5                                                          I Love Software Rendering
#> 6                                                           What on Earth Is Dekton?
#> 7                                                 JPEG XL vs. AVIF for web use-cases
#> 8                                                       Piramidal (YC W24) Is Hiring
#> 9        Stolen Renoir paintings found hidden, and damaged, behind cinder block wall
#> 10                                                                    Tesla Roadster
#> 11                                      RFC8950: Announce IPv4 with an IPv6 next-hop
#> 12    Is Liquid Metal Killing Our PCs? Scientific Analysis and a 2-Year Test [video]
#> 13 Woman who rescued injured crow keeps getting 'thank-you gifts' from birds [video]
#> 14                             How to make System 1 LLMs show System 2 competencies?
#> 15         Postgres 19 delayed after AI reviewers find more bugs than humans can fix
#> 16               Making 1,750 programmable PCB badges for Canada's biggest hackathon
#> 17                           Yet another way to invoke functions without parentheses
#> 18        US Rep Announces Congressional Legislation to Protect Video Game Ownership
#> 19                            Inside Polymarket's paid quote-retweet esports program
#> 20                                               How gyroscopes got so small [video]
#> 21                      Show HN: rStation – A shared research lab for your AI agents
#> 22                               The Economic Complexity of the Western Roman Empire
#> 23                                                    What was a Token Ring network?
#> 24        Show HN: OneDeploy – Managed open-source apps with nightly backups and TLS
#> 25                                               AI-assisted PCB design for KiCad 10
#> 26                                               How to Formalize All of Mathematics
#> 27    Show HN: Wonderhop – A daily game: guess what most people say, or what none do
#> 28           A story of WiFi secrets, UART lockdowns and a damaged flash memory chip
#> 29                                             Bark: The Toll-Free BBS for 90s Teens
#> 30                                                  The Folders Programming Language
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
