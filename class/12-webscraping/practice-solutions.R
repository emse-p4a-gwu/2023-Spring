library(tidyverse)
library(rvest)

# Practice 1 ----

# Scrape data on famous quotes from
# http://quotes.toscrape.com/

# Your resulting data frame should have these fields:
    
# - `title`: The film title 
# - `release_date`: The film release date
# - `director`: The film director
# - `intro`: The opening film crawl

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
