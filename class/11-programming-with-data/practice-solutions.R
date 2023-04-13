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
    df %>% 
        filter({{ condition }}) %>% 
        select({{ cols }})
}

# Example:
nycflights13::flights %>% 
    my_subset(month == 12, c("carrier", "flight"))
 
# Write `count_p(df, group)`, which returns a summary data frame of the 
# count of rows in `df` by `group` as well as the percentage of those counts.
    
count_p <- function(df, group) {
    df %>% 
        count({{ group }}, sort = TRUE) %>% 
        mutate(p = n / sum(n))
}
 
# Example: 
nycflights13::flights %>%
    count_p(carrier)


# Testing a data frame function: 

my_summary <- function(df, group, var) {
    df %>%
        group_by({{ group }}) %>%
        summarise(
            n = n(),
            mean = mean({{ var }}),
            sd = sd({{ var }})
        )
}

test_my_summary <- function() {
    
    cat("Testing my_summary()...")
    
    df1 <- diamonds %>% 
        my_summary(cut, price)  
    
    df2 <- diamonds %>% 
        group_by(cut) %>% 
        summarise(
            n = n(),
            mean = mean(price),
            sd = sd(price)
        )
    
    stopifnot(identical(df1, df2)) #<<
    
    cat("passed!")
}

test_my_summary()

# Practice 2 ----

# Write the function `filtered_scatter` which plots a scatterplot based on a
# condition, then use it for the two examples below. 

filtered_scatter <- function(df, condition, x, y) {
    df %>% 
        filter({{ condition }}) %>% 
        ggplot() +
        geom_point(aes(x = {{ x }}, y = {{ y }} ))
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

map(sw_people, \(x) length(x$vehicles))

# How many `titles` does each character in Game of Thrones have? 
# (use `got_chars`)

map(got_chars, \(x) length(x$titles))



# Quick practice 2 ----

# Replace `map()` with type-specific `map()`.

# What's each character's name?
map_chr(got_chars, \(x) x$name)
map_chr(sw_people, \(x) x$name)

# What color is each SW character's hair?
map_chr(sw_people, \(x) x$hair_color)

# Is the GoT character alive?
map_lgl(got_chars, \(x) x$alive)

# Is the SW character female?
map_lgl(sw_people, \(x) x$gender == "female")

# How heavy is each SW character?
map_chr(sw_people, \(x) x$mass)



# Practice 3 

# 1. Which SW film has the most characters? (use sw_films)

sw_films %>% 
    map_df(\(x) tibble(
        film = x$title,
        n_characters = length(x$characters)
    )) %>%
    arrange(desc(n_characters))

# 2. Which SW species has the highest average lifespan? (use sw_species)

sw_species %>%
    map_df(\(x) tibble(
        name = x$name,
        lifespan = x$average_lifespan
    )) %>% 
    mutate(lifespan = as.numeric(lifespan)) %>% 
    arrange(desc(lifespan))

# 3. Which GoT character(s) have been played by multiple actors? (use got_chars)

got_chars %>% 
    map_df(\(x) tibble(
        name = x$name,
        numActors = length(x$playedBy)
    )) %>% 
    filter(numActors > 1)

