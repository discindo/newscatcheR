
<!-- README.md is generated from README.Rmd. Please edit that file -->

# newscatcheR

<!-- badges: start -->

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/newscatcheR)](https://cran.r-project.org/package=newscatcheR)
[![CRAN_Download_Badge](https://cranlogs.r-pkg.org/badges/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
[![CRAN_Download_Badge](https://cranlogs.r-pkg.org/badges/grand-total/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
[![R-CMD-check](https://github.com/discindo/newscatcheR/actions/workflows/R-CMD-check.yml/badge.svg)](https://github.com/discindo/newscatcheR/actions/workflows/R-CMD-check.yml)
[![pkgdown](https://github.com/discindo/newscatcheR/actions/workflows/pkgdown.yml/badge.svg?branch=main)](https://github.com/discindo/newscatcheR/actions/workflows/pkgdown.yml)
[![codecov](https://codecov.io/gh/discindo/newscatcheR/graph/badge.svg?token=u3BlKDT8b3)](https://app.codecov.io/gh/discindo/newscatcheR)
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
#>  1 Hacker News https://news.yco… Links for the i… 2026-10-16 01:32:45 Tesla Roa…
#>  2 Hacker News https://news.yco… Links for the i… 2026-10-16 01:32:45 eBay Rest…
#>  3 Hacker News https://news.yco… Links for the i… 2026-10-16 01:32:45 Claude re…
#>  4 Hacker News https://news.yco… Links for the i… 2026-10-16 01:32:45 Llama.cpp…
#>  5 Hacker News https://news.yco… Links for the i… 2026-10-16 01:32:45 The NIST …
#>  6 Hacker News https://news.yco… Links for the i… 2026-10-16 01:32:45 JPEG XL v…
#>  7 Hacker News https://news.yco… Links for the i… 2026-10-16 01:32:45 90% of US…
#>  8 Hacker News https://news.yco… Links for the i… 2026-10-16 01:32:45 Apple ML …
#>  9 Hacker News https://news.yco… Links for the i… 2026-10-16 01:32:45 Designing…
#> 10 Hacker News https://news.yco… Links for the i… 2026-10-16 01:32:45 The Fatal…
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
#> 1                                                                     Tesla Roadster
#> 2         eBay Restricts Listings of Radio Equipment, but Exempts Ham-Band-Only Gear
#> 3                                                 Claude reveals ECDSA curve origins
#> 4          Llama.cpp on a jailbroken PS5: run any GGUF model natively on the console
#> 5                             The NIST Elliptic Curves Seeds Bounty Has Been Claimed
#> 6                                                 JPEG XL vs. AVIF for web use-cases
#> 7       90% of US working hours are spent on tasks not covered well by AI benchmarks
#> 8                          Apple ML Research: Muse Spark Open with MLX on Mac Studio
#> 9                              Designing more efficient quantum circuits with Claude
#> 10                                                             The Fatal Flaw of 911
#> 11                                                      Piramidal (YC W24) Is Hiring
#> 12                                         How the Claude Code team does code review
#> 13                          Big Fish: Exploiting a 37-Year-Old Kernel Bug in OpenBSD
#> 14                                           Show HN: Gemini 4 Argon plays StarCraft
#> 15                                          /dev/null: social network for developers
#> 16                                                          What on Earth Is Dekton?
#> 17       Stolen Renoir paintings found hidden, and damaged, behind cinder block wall
#> 18                                                         I Love Software Rendering
#> 19                             Anthropic assigned highest junk credit rating in June
#> 20                                                   C++26: The New Debugging Header
#> 21                                                           Monte-Carlo Simulations
#> 22                                                                         GifCities
#> 23 Woman who rescued injured crow keeps getting 'thank-you gifts' from birds [video]
#> 24     Show HN: Stoke Money – Personal finance app built around a cash flow forecast
#> 25                                      RFC8950: Announce IPv4 with an IPv6 next-hop
#> 26    Is Liquid Metal Killing Our PCs? Scientific Analysis and a 2-Year Test [video]
#> 27               Making 1,750 programmable PCB badges for Canada's biggest hackathon
#> 28                           Yet another way to invoke functions without parentheses
#> 29        US Rep Announces Congressional Legislation to Protect Video Game Ownership
#> 30                             How to make System 1 LLMs show System 2 competencies?
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
