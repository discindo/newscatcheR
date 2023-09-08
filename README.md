
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
# adding a small time delay to avoid simultaneous posts to the API
Sys.sleep(3)
get_news("ycombinator.com")
#> GET request successful. Parsing...
#> # A tibble: 30 × 10
#>    feed_title  feed_link         feed_description feed_pub_date       item_title
#>    <chr>       <chr>             <chr>            <dttm>              <chr>     
#>  1 Hacker News https://news.yco… Links for the i… 2023-09-07 20:21:01 NSO group…
#>  2 Hacker News https://news.yco… Links for the i… 2023-09-07 20:21:01 China's a…
#>  3 Hacker News https://news.yco… Links for the i… 2023-09-07 20:21:01 How Query…
#>  4 Hacker News https://news.yco… Links for the i… 2023-09-07 20:21:01 My Node.j…
#>  5 Hacker News https://news.yco… Links for the i… 2023-09-07 20:21:01 My speed …
#>  6 Hacker News https://news.yco… Links for the i… 2023-09-07 20:21:01 Show HN: …
#>  7 Hacker News https://news.yco… Links for the i… 2023-09-07 20:21:01 We built …
#>  8 Hacker News https://news.yco… Links for the i… 2023-09-07 20:21:01 The Silve…
#>  9 Hacker News https://news.yco… Links for the i… 2023-09-07 20:21:01 Unpacking…
#> 10 Hacker News https://news.yco… Links for the i… 2023-09-07 20:21:01 I rode wi…
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
#>                                                            feed_entries$item_title
#> 1               NSO group iPhone zero-click, zero-day exploit captured in the wild
#> 2  China's ancient water pipe networks show no evidence of a centralized authority
#> 3                                                           How Query Engines Work
#> 4                                                        My Node.js is a bit Rusty
#> 5                                                             My speed cubing page
#> 6                       Show HN: HackYourNews – AI summaries of the top HN stories
#> 7                        We built an AI-powered Magic the Gathering card generator
#> 8                                                          The Silver Thief (2004)
#> 9                                                         Unpacking Elixir: Syntax
#> 10                            I rode with an ice road trucker to the Arctic Circle
#> 11                                 LLMs, RAG, and the missing storage layer for AI
#> 12         John McCarthy’s collection of numerical facts for use in elisp programs
#> 13                                                                        Lean 4.0
#> 14                                                A BERT for laptops, from scratch
#> 15                 Buffalo buffalo Buffalo buffalo buffalo buffalo Buffalo buffalo
#> 16                            North Korean campaign targeting security researchers
#> 17                                    Understanding Request Latency with Profiling
#> 18                                                        What's new in Emacs 29.1
#> 19                                                             London Street Trees
#> 20          Federated benchmarking of medical artificial intelligence with MedPerf
#> 21                                 Animations From First Principles (in 5 minutes)
#> 22                                      Cthulhu.jl – show type-inferred Julia code
#> 23     Coincidentally-identical waypoint names foxed UK air traffic control system
#> 24                               Accidental Empires, Chapter 11 – Font Wars (1992)
#> 25                           Deciphering Mary Stuart’s lost letters from 1578-1584
#> 26                                                Keith Haring’s Computer Drawings
#> 27              Chrome now tracks users and shares a “topic” list with advertisers
#> 28                                               Why isn't chess popular in Japan?
#> 29                     NaNofuzz: A Usable Tool for Automatic Test Generation [pdf]
#> 30                                                                        Slack AI
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
