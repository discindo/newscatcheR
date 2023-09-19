
<!-- README.md is generated from README.Rmd. Please edit that file -->

# newscatcheR

<!-- badges: start -->

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/newscatcheR)](https://cran.r-project.org/package=newscatcheR)
[![CRAN_Download_Badge](https://cranlogs.r-pkg.org/badges/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
[![CRAN_Download_Badge](https://cranlogs.r-pkg.org/badges/grand-total/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
![R-CMD-check](https://github.com/discindo/newscatcheR/workflows/R-CMD-check/badge.svg)
![pkgdown](https://github.com/discindo/newscatcheR/workflows/pkgdown/badge.svg)
[![codecov](https://codecov.io/gh/discindo/newscatcheR/graph/badge.svg?token=u3BlKDT8b3)](https://codecov.io/gh/discindo/newscatcheR)
[![R-CMD-check](https://github.com/discindo/newscatcheR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/discindo/newscatcheR/actions/workflows/R-CMD-check.yaml)
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
#>  1 Hacker News https://news.yco… Links for the i… 2023-09-19 00:30:02 Mythbuste…
#>  2 Hacker News https://news.yco… Links for the i… 2023-09-19 00:30:02 Show HN: …
#>  3 Hacker News https://news.yco… Links for the i… 2023-09-19 00:30:02 Mwmbl: Fr…
#>  4 Hacker News https://news.yco… Links for the i… 2023-09-19 00:30:02 Fidonet R…
#>  5 Hacker News https://news.yco… Links for the i… 2023-09-19 00:30:02 Van Gogh’…
#>  6 Hacker News https://news.yco… Links for the i… 2023-09-19 00:30:02 Self-supe…
#>  7 Hacker News https://news.yco… Links for the i… 2023-09-19 00:30:02 Making II…
#>  8 Hacker News https://news.yco… Links for the i… 2023-09-19 00:30:02 Why and w…
#>  9 Hacker News https://news.yco… Links for the i… 2023-09-19 00:30:02 Tackling …
#> 10 Hacker News https://news.yco… Links for the i… 2023-09-19 00:30:02 Seeking h…
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
#>                                                             feed_entries$item_title
#> 1                                             Mythbusters: Wing Commander I Edition
#> 2                   Show HN: HyperDX – open-source dev-friendly Datadog alternative
#> 3                             Mwmbl: Free, open-source and non-profit search engine
#> 4                                                              Fidonet Rules (2014)
#> 5                                                         Van Gogh’s Self-Portraits
#> 6                  Self-supervised learning: The dark matter of intelligence (2021)
#> 7                                      Making IIIF Official at the Internet Archive
#> 8                            Why and when the Sahara Desert was green: new research
#> 9        Tackling the curse of dimensionality with physics-informed neural networks
#> 10                             Seeking help to preserve WWII database on Windows 98
#> 11         Replanting logged forests with diverse seedlings accelerates restoration
#> 12                                       Tell HN: ChatGPT cut off date now Jan 2022
#> 13                              The daguerreotype is famous – why not the calotype?
#> 14                Playing cards that taught 17th-century cooks to carve meat (2019)
#> 15                             How hard is it to adapt a memory allocator to CHERI?
#> 16                                       The joys of maintenance programming (2011)
#> 17                                     Some new snippets from the Snowden documents
#> 18                                   How FoundationDB works and why it works (2021)
#> 19                                Forty years of GNU and the free software movement
#> 20 Early performance results from the prototype CHERI ARM Morello microarchitecture
#> 21                      The brain is not an onion with a tiny reptile inside (2020)
#> 22                       OpenRA – Classic strategy games rebuilt for the modern era
#> 23                                                            Pentominoku for Layla
#> 24                                       Ask HN: 6 months later. How is Bard doing?
#> 25                                               Mysteries of the Court of Miracles
#> 26 FTC warns pharma companies about sham patent listings designed to delay generics
#> 27                                                                         Georgism
#> 28                                          F-35 can’t be found after pilot ejected
#> 29                                         NSA Backdoor Key from Lotus-Notes (1997)
#> 30                                                Apple TV, now with more Tailscale
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
