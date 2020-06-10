
<!-- README.md is generated from README.Rmd. Please edit that file -->

# newscatcheR

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/newscatcheR)](https://cran.r-project.org/package=newscatcheR)
[![CRAN\_Download\_Badge](http://cranlogs.r-pkg.org/badges/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
[![CRAN\_Download\_Badge](http://cranlogs.r-pkg.org/badges/grand-total/newscatcheR)](https://CRAN.R-project.org/package=newscatcheR)
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
#>  1 Hacker Ne… https://… Links for the i… 2020-06-10 09:03:49 Create di…
#>  2 Hacker Ne… https://… Links for the i… 2020-06-10 09:03:49 SeL4 is v…
#>  3 Hacker Ne… https://… Links for the i… 2020-06-10 09:03:49 Writing a…
#>  4 Hacker Ne… https://… Links for the i… 2020-06-10 09:03:49 Stanford …
#>  5 Hacker Ne… https://… Links for the i… 2020-06-10 09:03:49 Logic.ly …
#>  6 Hacker Ne… https://… Links for the i… 2020-06-10 09:03:49 Teaching …
#>  7 Hacker Ne… https://… Links for the i… 2020-06-10 09:03:49 First U.S…
#>  8 Hacker Ne… https://… Links for the i… 2020-06-10 09:03:49 Welcome t…
#>  9 Hacker Ne… https://… Links for the i… 2020-06-10 09:03:49 No Recent…
#> 10 Hacker Ne… https://… Links for the i… 2020-06-10 09:03:49 A ‘Useles…
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
#> 1                                          Create diagrams using code with Graphviz
#> 2                                                        SeL4 is verified on RISC-V
#> 3                      Writing a full-text search engine using Bloom filters (2013)
#> 4                               Stanford Class on Deep Multi-Task and Meta-Learning
#> 5  Logic.ly – Digital logic simulator for teaching logic gates and digital circuits
#> 6                             Teaching my MIT classes with only free/libre software
#> 7             First U.S. woman to walk in space dives to deepest point in the ocean
#> 8                Welcome to the 21st Century: How to Plan for the Post-Covid Future
#> 9                                                   No Recent Automation Revolution
#> 10                             A ‘Useless’ Perspective That Transformed Mathematics
#> 11   Scraping Roger Ebert’s reviews and finding his favorite movies on Amazon Prime
#> 12                   Windows Privacy Dashboard: GUI for Windows 10 Privacy Settings
#> 13          A tiny static full-text search engine using Rust and WebAssembly (2019)
#> 14                                                           Test Anything Protocol
#> 15                                Unsupervised translation of programming languages
#> 16                                                                 Whistler (Radio)
#> 17                                   Way to keep your cool running a Raspberry Pi 4
#> 18   DeepMind introduces ‘EATS’: adversarial, end-to-end approach to text-to-speech
#> 19   Browse hundreds of jobs at actively hiring YC companies with Work at a Startup
#> 20                       Snabb: 100 Gbit/s pure software switching using Lua (2019)
#> 21                                                       Quotebacks – Quote the Web
#> 22                                          How Birds Evolved From Dinosaurs (2015)
#> 23                    Large-Scale Transactional Data Lake at Uber Using Apache Hudi
#> 24                                                          From chaos to free will
#> 25                        New hints of volcanism under the heart of northern Europe
#> 26                                                 Haiku R1/beta2 has been released
#> 27                           Let Game Theory Tell You When It’s Time to Go Shopping
#> 28          Show HN: XgeneCloud – Instant REST and GraphQL APIs on Any SQL Database
#> 29                             New inline assembly syntax available in Rust nightly
#> 30                                 IBM Cloud was down, as well as their status page
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
