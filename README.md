
<!-- README.md is generated from README.Rmd. Please edit that file -->

# newscatcheR

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/newscatcheR)](https://cran.r-project.org/package=newscatcheR)
[![CRAN\_Download\_Badge](https://cranlogs.r-pkg.org/badges/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
[![CRAN\_Download\_Badge](https://cranlogs.r-pkg.org/badges/grand-total/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
![R-CMD-check](https://github.com/discindo/newscatcheR/workflows/R-CMD-check/badge.svg)
![pkgdown](https://github.com/discindo/newscatcheR/workflows/pkgdown/badge.svg)
[![Codecov test
coverage](https://app.codecov.io/gh/discindo/newscatcheR/branch/master/graph/badge.svg)](https://app.codecov.io/gh/discindo/newscatcheR?branch=master)

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
#>  1 Hacker Ne… https://… Links for the i… 2020-07-12 17:00:35 Wt – C++ …
#>  2 Hacker Ne… https://… Links for the i… 2020-07-12 17:00:35 The Futur…
#>  3 Hacker Ne… https://… Links for the i… 2020-07-12 17:00:35 Robot Gam…
#>  4 Hacker Ne… https://… Links for the i… 2020-07-12 17:00:35 Apple Sil…
#>  5 Hacker Ne… https://… Links for the i… 2020-07-12 17:00:35 SAS Rescu…
#>  6 Hacker Ne… https://… Links for the i… 2020-07-12 17:00:35 Do not re…
#>  7 Hacker Ne… https://… Links for the i… 2020-07-12 17:00:35 Rust for …
#>  8 Hacker Ne… https://… Links for the i… 2020-07-12 17:00:35 Cockroach…
#>  9 Hacker Ne… https://… Links for the i… 2020-07-12 17:00:35 Candy Lan…
#> 10 Hacker Ne… https://… Links for the i… 2020-07-12 17:00:35 A gentle …
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
#>                                                       feed_entries$item_title
#> 1                                                        Wt – C++ Web Toolkit
#> 2                              The Future of Online Identity Is Decentralized
#> 3                                        Apple Silicon: The Passing of Wintel
#> 4                           Robot Game: Comparing 6502 C, Assembly, and Forth
#> 5                           SAS Rescue 3 Trapped British Diplomats in Albania
#> 6                                   Do not remain nameless to yourself (1966)
#> 7                                 Show HN: Sed to C translator written in sed
#> 8                 Rust for JavaScript Developers – Pattern Matching and Enums
#> 9                              Candy Land Was Invented for Polio Wards (2019)
#> 10                   Cockroachdb/copyist: Mocking an SQL database in Go tests
#> 11              A gentle introduction to HDBSCAN and density-based clustering
#> 12  Underwater caves in Mexico preserve one of the world’s oldest ochre mines
#> 13   Sirum (YC W15 Nonprofit) hiring back end engineer to automate a pharmacy
#> 14                        Digital Audio on VHS – The Technics SV-P100 [video]
#> 15 Lava tubes may be havens for ancient alien life and future human explorers
#> 16                               The company that sells lost airplane luggage
#> 17           Sandboxie-Plus – a fork of Sandboxie with improved functionality
#> 18          Show HN: Learnawesome.org – Open-source learning map for humanity
#> 19                                               MariaDB Temporal Data Tables
#> 20                                                         Just Too Efficient
#> 21                                                 Ruby lib/irb/easter-egg.rb
#> 22                                                               Tour of Rust
#> 23                         Building a self-updating profile README for GitHub
#> 24                                          Linux kernel in-tree Rust support
#> 25                     US citizens warned they face arbitrary arrest in China
#> 26                                                      Dealing with Insomnia
#> 27                   An F-22 test pilot on the Raptor's flight control system
#> 28                                                   How to Understand Things
#> 29                                                      The Polymath Playbook
#> 30                Moving from Siloed Organizations to Distributed Individuals
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
#>            clean_url language topic_unified main clean_country
#> 1204   repubblica.it       it          tech None            IT
#> 2276     lastampa.it       it          tech None            IT
#> 2673 ilsole24ore.com       it          tech None            IT
#> 3618     corriere.it       it          tech None            IT
#> 4159         ansa.it       it          tech None            IT
#>                                                              rss_url GlobalRank
#> 1204    http://www.repubblica.it/rss/scienza_e_tecnologia/rss2.0.xml       1086
#> 2276                       http://www.lastampa.it/tecnologia/rss.xml       2413
#> 2673                   http://nova.ilsole24ore.com/nova24ora/rss.xml       2681
#> 3618                       http://www.corriere.it/rss/tecnologia.xml       1328
#> 4159 http://www.ansa.it/web/notizie/rubriche/scienza/scienza_rss.xml       2248
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
