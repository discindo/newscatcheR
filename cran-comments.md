## Test environments
* local OS X install, R 3.6.3
* local 5.6.6-arch1-1 linux install, R 3.6.3
* local windows 10 install, R 3.6.3

## R CMD check results
There were no ERRORs, WARNINGs or NOTEs. 

This is my first submission to CRAN. 
I followed the interactive menu of devtools::release to submit to r-hub first. From r-hub I got one error in a messege about not being able to install on windows, but in subsequent messages the error was not there. 
I got one note about the license, but I don't understand why -- I tried to follow other packages in how it's specified and it's MIT license.
devtools::check_win() didn't return any errors.

