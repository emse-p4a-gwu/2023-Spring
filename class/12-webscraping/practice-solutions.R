# install.packages("usethis")

library(tidyverse)
library(rvest)
library(usethis)

# Practice 1 ----

# Scrape data on famous quotes from
# http://quotes.toscrape.com/

# Your resulting data frame should have these fields:

# - `quote`: The quote
# - `author`: The author of the quote
# - `about_url`: The url to the "about" page

url <- "http://quotes.toscrape.com"
html <- read_html(url)

quote_nodes <- html %>% 
    html_elements(".quote")

df <- tibble(
    quote = quote_nodes %>%
        html_element(".text") %>%
        html_text(),
    author = quote_nodes %>%
        html_element(".author") %>%
        html_text(), 
    about_url = quote_nodes %>%
        html_element("a") %>% 
        html_attr("href")
) %>% 
    # Pasting on the root url since the scraped urls are only *relative* urls
    mutate(about_url = paste0(url, about_url))

head(df)



# Practice 2 ----

# Template code is provided to scrape data on F1 drivers for the 2022 season from
# https://www.formula1.com/en/results.html/2022/drivers.html
# 
# Your job is to extend it to scrape the data from seasons 2010 to 2022.

# Code to scrape data from a single page (the 2022 season):

url <- "https://www.formula1.com/en/results.html/2022/drivers.html"

# Get the data frame
df_list <- read_html(url) %>% 
    html_table()
df <- df_list[[1]]
df$year <- 2022 # Store the year (not in the scraped data)

# Some formatting
df <- df %>% 
    select(
        year, position = Pos, driver = Driver, nationality = Nationality, 
        team = Car, points = PTS
    ) %>% 
    separate(driver, into = c('first', 'last', 'abb'))
head(df)

# Now, extend this to scrape the data from seasons 2010 to 2022

# First, write a function to scrape data from one page

get_f1_data <- function(year) {
    
    # Build the url
    url_start <- "https://www.formula1.com/en/results.html/"
    url_end <- "/drivers.html"
    url <- paste(url_start, year, url_end, sep = "")
    
    # Get the data frame
    df_list <- read_html(url) %>% 
        html_table()
    df <- df_list[[1]]
    df$year <- year # Store the year (not in the scraped data)
    
    # Some formatting
    df <- df %>% 
        select(
            year, position = Pos, driver = Driver, nationality = Nationality, 
            team = Car, points = PTS
        ) %>% 
        separate(driver, into = c('first', 'last', 'abb'))
    
    return(df)
}

# Now map the function onto the desired set of years

years <- 2010:2022
df <- map_df(years, \(x) get_f1_data(x))

head(df)



# Class stock price example ----

# Documentation: https://www.alphavantage.co/documentation/#dailyadj

# If you want to run this, you'll have to get an API from here: 
# https://www.alphavantage.co/support/#api-key

# Store your key as ALPHAVANTAGE_API_KEY in your .Renviron:
# usethis::edit_r_environ()

api_key <- Sys.getenv("ALPHAVANTAGE_API_KEY")
symbol <- "NFLX" # Netflix

# Build the url data request

url <- paste0(
    "https://www.alphavantage.co/query", 
    "?function=TIME_SERIES_DAILY_ADJUSTED",
    "&symbol=", symbol, 
    "&apikey=", api_key, 
    "&datatype=csv"
)

# Read in the data

df <- read_csv(url)

df %>% 
    ggplot() + 
    geom_line(
        aes(
            x = timestamp, 
            y = adjusted_close
        )
    ) + 
    theme_bw() +
    labs(
        x = "Date",
        y = "Closing Price ($USD)", 
        title = paste0("Stock Prices: ", symbol)
    )


# Practice 3 ----

# 1. Register for a key here: https://apidocs.covidactnow.org/

# 2. Use `usethis::edit_r_environ()` to edit your .Renviron
usethis::edit_r_environ()

# 3. Store your key as `COVID_ACT_NOW_KEY`

# 4. Load your API key
api_key <- Sys.getenv("COVID_ACT_NOW_KEY")

# 5. Build the url to request historical state-level data. Docs here:
# https://apidocs.covidactnow.org/#historic-data-for-all-states-counties-or-metros

url <- paste0(
    "https://api.covidactnow.org/v2/states.timeseries.csv?apiKey=",
    api_key
)

# 6. Read in the data, then make this figure of daily COVID19 cases in DC

df <- read_csv(url)

df %>% 
    filter(state == "DC") %>% 
    ggplot() + 
    geom_line(
        aes(
            x = date, 
            y = actuals.newCases
        )
    ) + 
    theme_bw()
