
<!-- README.md is generated from README.Rmd. Please edit that file -->

# newscatcheR

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/newscatcheR)](https://cran.r-project.org/package=newscatcheR)
[![CRAN\_Download\_Badge](https://cranlogs.r-pkg.org/badges/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
[![CRAN\_Download\_Badge](https://cranlogs.r-pkg.org/badges/grand-total/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
![R-CMD-check](https://github.com/discindo/newscatcheR/workflows/R-CMD-check/badge.svg)
![pkgdown](https://github.com/discindo/newscatcheR/workflows/pkgdown/badge.svg)
[![Codecov test
coverage](https://codecov.io/gh/discindo/newscatcheR/branch/master/graph/badge.svg)](https://codecov.io/gh/discindo/newscatcheR?branch=master)

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
#>  1 Hacker Ne… https://… Links for the i… 2020-07-11 18:22:03 How much …
#>  2 Hacker Ne… https://… Links for the i… 2020-07-11 18:22:03 CRDTs: Th…
#>  3 Hacker Ne… https://… Links for the i… 2020-07-11 18:22:03 How to Un…
#>  4 Hacker Ne… https://… Links for the i… 2020-07-11 18:22:03 Scientist…
#>  5 Hacker Ne… https://… Links for the i… 2020-07-11 18:22:03 Show HN: …
#>  6 Hacker Ne… https://… Links for the i… 2020-07-11 18:22:03 Testing F…
#>  7 Hacker Ne… https://… Links for the i… 2020-07-11 18:22:03 Show HN: …
#>  8 Hacker Ne… https://… Links for the i… 2020-07-11 18:22:03 A Doctor …
#>  9 Hacker Ne… https://… Links for the i… 2020-07-11 18:22:03 AES67 (Au…
#> 10 Hacker Ne… https://… Links for the i… 2020-07-11 18:22:03 Tracking …
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
get_headlines("ycombinator.com")
#> GET request successful. Parsing...
#>                                                             feed_entries$item_title
#> 1                                  How much your computer can do in a second (2015)
#> 2                                                     CRDTs: The Hard Parts [video]
#> 3                                                          How to Understand Things
#> 4                 Scientists say you can cancel the noise but keep your window open
#> 5   Show HN: Trail Router – generate running routes that prefer greenery and nature
#> 6                            Testing Firefox More Efficiently with Machine Learning
#> 7     Show HN: An extension that removes upvote and comment counts from Hacker News
#> 8               A Doctor Who Championed Hand-Washing And Briefly Saved Lives (2015)
#> 9                                          AES67 (Audio over IP protocol) resources
#> 10                                     Tracking Pico Balloons Using Ham Radio [pdf]
#> 11 CDC director: Keeping schools closed greater health threat to children reopening
#> 12            Favorite Problems: A Practical Framework for Discovering Your Purpose
#> 13                                                              Refined Hacker News
#> 14                                            Scanimage: Scan from the Command Line
#> 15                                                     Soup.io Will Be Discontinued
#> 16                     Ask HN: What's the worst piece of software you use everyday?
#> 17                                                  Virtual Wind Instruments (2018)
#> 18                                                           The Case for Causal AI
#> 19                                                          Beware of Being “Right”
#> 20    A Little Startup That Could: Aquarius Builds an Engine Others Only Dreamed Of
#> 21                                                Why are toys such a bad business?
#> 22                                             Decentralized Reinforcement Learning
#> 23                          Modes, Medians and Means: A Unifying Perspective (2013)
#> 24                                             Migrating Away from Google Analytics
#> 25                           Global Decision-Making via Local Economic Transactions
#> 26                                 2000-year-old Iron Age skeleton discovered in UK
#> 27                                      Eigenquestions: The Art of Framing Problems
#> 28                 Show HN: Form-validation.js – JavaScript form validation library
#> 29                                                             Oura Ring 2 Teardown
#> 30                                                Linux kernel in-tree Rust support
```

`describe_url(website)` returns the topics of a given web site.

``` r
describe_url("bbc.com")
#> Topics available for website bbc.comare: travel, science, news, business.
```

`filter_urls(topic, country, language )` can be used to browse the
dataset by topic, country or language.

``` r
filter_urls(topic = "tech", country = "IT", language = "it")
#> # A tibble: 5 x 7
#>   clean_url  language topic_unified main  clean_country rss_url       GlobalRank
#>   <chr>      <chr>    <chr>         <chr> <chr>         <chr>         <chr>     
#> 1 repubblic… it       tech          None  IT            http://www.r… 1086      
#> 2 lastampa.… it       tech          None  IT            http://www.l… 2413      
#> 3 ilsole24o… it       tech          None  IT            http://nova.… 2681      
#> 4 corriere.… it       tech          None  IT            http://www.c… 1328      
#> 5 ansa.it    it       tech          None  IT            http://www.a… 2248
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
