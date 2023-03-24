# install.packages('tidyverse')
# install.packages('here')

library(tidyverse)
library(here)

# Spice girls data:
spicegirls <- tibble(
    firstName   = c("Melanie", "Melanie", "Emma", "Geri", "Victoria"),
    lastName    = c("Brown", "Chisholm", "Bunton", "Halliwell", "Beckham"),
    spice       = c("Scary", "Sporty", "Baby", "Ginger", "Posh"),
    yearOfBirth = c(1975, 1974, 1976, 1972, 1974),
    deceased    = c(FALSE, FALSE, FALSE, FALSE, FALSE)
)

# Beatles data:
beatles <- tibble(
    firstName   = c("John", "Paul", "Ringo", "George"),
    lastName    = c("Lennon", "McCartney", "Starr", "Harrison"),
    yearOfBirth = c(1940, 1942, 1940, 1943),
    deceased    = c(TRUE, FALSE, FALSE, TRUE),
    band        = 'beatles'
)

# Create the bands data frame:
spicegirls <- spicegirls %>%
    select(-spice) %>%
    mutate(band = 'spicegirls')

bands <- bind_rows(spicegirls, beatles)



# Practice 1 ------------------------------

# Read in the datas

# Create a new data frame, df_birds, that contains only the variables
# (columns) about the species of bird.


# Create a new data frame, dc, that contains only the observations (rows)
# from DC airports.


# Create a new data frame, dc_birds_known, that contains only the observations
# (rows) from DC airports and those where the species of bird is known.


# How many known unique species of birds have been involved in accidents at
# DC airports?





# Practice 2 ------------------------------

# Read in the data 


# Create a new data frame, dc_dawn, that contains only the observations
# (rows) from DC airports that occurred at dawn.


# Create a new data frame, dc_dawn_birds, that contains only the
# observations (rows) from DC airports that occurred at dawn and
# only the variables (columns) about the species of bird.


# Create a new data frame, dc_dawn_birds_known, that contains only the
# observations (rows) from DC airports that occurred at dawn and only
# the variables (columns) about the KNOWN species of bird.


# How many known unique species of birds have been involved in accidents at DC airports at dawn?



# Practice 3 ------------------------------

# height_miles: The height variable converted to miles
# (Hint: there are 5,280 feet in a mile).

# cost_mil: TRUE if the repair costs was greater or equal to $1 million,
# FALSE otherwise.

# season: One of four seasons based on the incident_month variable:
#   spring: March, April, May
#   summer: June, July, August
#   fall: September, October, November
#   winter: December, January, February



# Practice 4 ------------------------------

# Read in the data 


# Create a summary data frame that contains the mean height for each different time of day.


# Create a summary data frame that contains the maximum cost_repairs_infl_adj for each year.


# Which month has had the greatest number of reported incidents?



# Which year has had the greatest number of reported incidents?






# Exporting data


# Save the result in your "data" folder:

