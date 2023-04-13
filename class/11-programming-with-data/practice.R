# install.package('tidyverse')
# install.package('palmerpenguins')
# install.package('gapminder')
# install.package('repurrrsive')

library(tidyverse)
library(palmerpenguins)
library(gapminder)
library(repurrrsive)

# Practice 1 ----

# Write `my_subset(df, condition, cols)`, which returns a subset of `df` 
# by filtering the rows based on `condition` and only includes the select 
# `cols`

my_subset <- function(df, condition, cols) {
    # Write code here
}

# Example:
nycflights13::flights %>% 
    my_subset(month == 12, c("carrier", "flight"))
 
# Write `count_p(df, group)`, which returns a summary data frame of the 
# count of rows in `df` by `group` as well as the percentage of those counts.
    
count_p <- function(df, group) {
    # Write code here
}
 
# Example: 
nycflights13::flights %>%
    count_p(carrier)



# Practice 2 ----

# Write the function `filtered_scatter` which plots a scatterplot based on a
# condition, then use it for the two examples below. 

filtered_scatter <- function(df, condition, x, y) {
    # Write code here
}

# Examples:
filtered_scatter(
    penguins, sex == "male", 
    x = body_mass_g, y = bill_length_mm)

filtered_scatter(
    penguins, species == "Gentoo", 
    x = body_mass_g, y = flipper_length_mm)


# Quick practice 1 ----

# How many `vehicles` does each Star Wars character have? 
# (use `sw_people`)



# How many `titles` does each character in Game of Thrones have? 
# (use `got_chars`)





# Quick practice 2 ----

# Replace `map()` with type-specific `map()`.

# What's each character's name?
map(got_chars, \(x) x$name)
map(sw_people, \(x) x$name)

# What color is each SW character's hair?
map(sw_people, \(x) x$hair_color)

# Is the GoT character alive?
map(got_chars, \(x) x$alive)

# Is the SW character female?
map(sw_people, \(x) x$gender == "female")

# How heavy is each SW character?
map(sw_people, \(x) x$mass)



# Practice 3 

# 1. Which SW film has the most characters? (use sw_films)


# 2. Which SW species has the highest average lifespan? (use sw_species)


# 3. Which GoT character(s) have been played by multiple actors? (use got_chars)

