
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
#>  1 Hacker Ne… https://… Links for the i… 2020-07-07 16:50:50 Searchabl…
#>  2 Hacker Ne… https://… Links for the i… 2020-07-07 16:50:50 Show HN: …
#>  3 Hacker Ne… https://… Links for the i… 2020-07-07 16:50:50 Caffenol:…
#>  4 Hacker Ne… https://… Links for the i… 2020-07-07 16:50:50 Dune: The…
#>  5 Hacker Ne… https://… Links for the i… 2020-07-07 16:50:50 Google Co…
#>  6 Hacker Ne… https://… Links for the i… 2020-07-07 16:50:50 Keeping y…
#>  7 Hacker Ne… https://… Links for the i… 2020-07-07 16:50:50 Classifyi…
#>  8 Hacker Ne… https://… Links for the i… 2020-07-07 16:50:50 The Slack…
#>  9 Hacker Ne… https://… Links for the i… 2020-07-07 16:50:50 Nokia to …
#> 10 Hacker Ne… https://… Links for the i… 2020-07-07 16:50:50 Google of…
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
#>                                                           feed_entries$item_title
#> 1                                                        Searchable PPP Loan Data
#> 2                            Show HN: SheetUI – Turn Google Sheets into Web Pages
#> 3                   Caffenol: Developing Photos with Coffee and Vitamin C [video]
#> 4                        Dune: The Battle for Arrakis – Extended Reference (2003)
#> 5                                                  Google Common Lisp style guide
#> 6                                              Keeping your Go modules compatible
#> 7                                  Classifying 200k articles in 7 hours using NLP
#> 8                                                        The Slack Social Network
#> 9                           Nokia to add open interfaces to its telecom equipment
#> 10                         Google offers free fabbing for 130nm open-source chips
#> 11                                                          Stock and Flow (2010)
#> 12 Show HN: I built a desktop radiation monitor with Raspberry Pi, brass and wood
#> 13                                         Turn your phone into a wireless webcam
#> 14                          YouTube deleted an electronics repair channel [video]
#> 15  Show HN: Reclaim – an adaptive calendar app that plans time for your routines
#> 16                           A terrible, horrible, no-good, very bad day at Slack
#> 17                      Coconut: Simple, elegant, Pythonic functional programming
#> 18  Work at a Startup: Find thousands of engineering roles at active YC companies
#> 19                                            Whole Earth Software Catalog (1984)
#> 20                                      Robot Disinfects Greater Boston Food Bank
#> 21           New Compute Engine A2 VMs–First Nvidia Ampere A100 GPUs in the Cloud
#> 22   Kosher search engine powered by 4 car batteries on a passively cooled server
#> 23           The Ayn Rand Institute Takes a Loan from Paycheck Protection Program
#> 24                          Mike Pompeo Said the US Is Considering Banning TikTok
#> 25                            Only 9% of visitors give GDPR consent to be tracked
#> 26            Ask HN: What makes a good technical leader – any recommended books?
#> 27                                 Disk Spilling in a Vectorized Execution Engine
#> 28                                                 Algorithms Are Now Commodities
#> 29                                           Building Domain Driven Microservices
#> 30                                            Dark patterns in GDPR consent boxes
```

`tld_sources(tld)` returns rows from the provided dataset of news sites
with the given top level domain

``` r
library(newscatcheR)
tld_sources("it")
#> # A tibble: 238 x 7
#>    clean_url  language topic_unified main  clean_country rss_url      GlobalRank
#>    <chr>      <chr>    <chr>         <chr> <chr>         <chr>        <chr>     
#>  1 zonalocal… it       news          1     None          http://www.… 620899    
#>  2 wittgenst… it       news          1     None          http://www.… 321276    
#>  3 wired.it   it       tech          1     None          http://www.… 10861     
#>  4 wired.it   it       science       None  None          http://www.… 10861     
#>  5 wired.it   it       news          None  None          http://www.… 10861     
#>  6 wired.it   it       economics     None  None          http://www.… 10861     
#>  7 webtrek.it it       tech          1     None          http://www.… 546151    
#>  8 vita.it    it       world         None  None          http://www.… 37772     
#>  9 vita.it    it       politics      None  None          http://www.… 37772     
#> 10 vita.it    it       news          1     None          http://www.… 37772     
#> # … with 228 more rows
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
