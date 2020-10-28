library(RSQLite)
library(curl)

# download the db file from the original newscatcher package repo
url <-
  "https://github.com/kotartemiy/newscatcher/raw/master/newscatcher/data/package_rss.db"
dbfile <- tempfile(fileext = ".db")

download.file(
  url = url,
  destfile = dbfile,
  quiet = TRUE,
  mode = "wb"
)

# access the database
sqlite.driver <- dbDriver("SQLite")
db <- dbConnect(sqlite.driver,
                dbname = dbfile)
dbListTables(db)

# import data
package_rss <- dbReadTable(db, "rss_main")

# close db connection
dbDisconnect(db)

usethis::use_data("package_rss")
