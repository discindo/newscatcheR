# version 0.0.2

Updated dependency for tidyRSS >= 2.0.2 which requires dplyr 1.0.0

## Test environments
* local 5.6.15-arch1-1 linux install, R 4.0.0
* local windows 10 install, R 4.0.0

## R CMD check results
There were no ERRORs, WARNINGs or NOTEs. 

## Rhub / Win-builder
devtools::check_rhub() returned an error about not being able to install on Windows with reference to Rcpp.dll
devtools::check_win() didn't return any errors.


# version 0.0.1

## Test environments
* local OS X install, R 3.6.3
* local 5.6.6-arch1-1 linux install, R 3.6.3
* local windows 10 install, R 3.6.3

## R CMD check results
There were no ERRORs, WARNINGs or NOTEs. 

This is my first submission to CRAN. 
I followed the interactive menu of devtools::release to submit to r-hub first. From r-hub I got one error in a messege about not being able to install on windows, but in subsequent messages the error was not there. 
devtools::check_win() didn't return any errors.
I corrected the License and description as notified.
I added the missing: Discindo [cph]
