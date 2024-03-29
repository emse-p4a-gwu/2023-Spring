# install.packages("stringr")
# install.packages("dplyr")
# install.packages("ggplot2")
# install.packages("readr")
# install.packages("here")
library(dplyr)
library(stringr)
library(ggplot2)
library(readr)
library(here)

# Beatles data:
beatles <- tibble(
    firstName   = c("John", "Paul", "Ringo", "George"),
    lastName    = c("Lennon", "McCartney", "Starr", "Harrison"),
    instrument  = c("guitar", "bass", "drums", "guitar"),
    yearOfBirth = c(1940, 1942, 1940, 1943),
    deceased    = c(TRUE, FALSE, FALSE, TRUE)
)

# Practice 1 ------------------------------

animals_farm <- tibble(
    name           = c("cow", "horse"),
    sound          = c("moo", "neigh"),
    aveWeightLbs   = c(2400, 1500),
    aveLifeSpanYrs = c(20, 25)
)

animals_pet <- tibble(
    name           = c("dog", "cat"),
    sound          = c("woof", "meow"),
    aveWeightLbs   = c(40, 8),
    aveLifeSpanYrs = c(10, 12)
)

# Write code to find how many rows are in the animals_farm data frame?

# Write code to find how many columns are in the animals_pet data frame?

# Create a new data frame, animals, by combining animals_farm and animals_pet.

# Change the column names of animals to title case.

# Add a new column to animals called type that tells if an animal is a "farm" 
# or "pet" animal.



# Practice 2 ------------------------------

beatles <- tibble(
    firstName   = c("John", "Paul", "Ringo", "George"),
    lastName    = c("Lennon", "McCartney", "Starr", "Harrison"),
    instrument  = c("guitar", "bass", "drums", "guitar"),
    yearOfBirth = c(1940, 1942, 1940, 1943),
    deceased    = c(TRUE, FALSE, FALSE, TRUE)
)

# 1. Create a new column, playsGuitar, which is TRUE if the band member
#    plays the guitar and FALSE otherwise.


# 2. Filter the data frame to select only the rows for the band members
#    who have four-letter first names.

# 3. Create a new column, fullName, which contains the band member's
#    first and last name separated by a space (e.g. "John Lennon")



# Practice 3 ------------------------------

# Read in the data

# How many rows and columns are in the data frame?

# What type of data is each column?

# Preview the different columns - what do you think this data is about?
# What might one row represent?

# How many unique airports are in the data frame?

# What is the earliest and latest observation in the data frame?

# What is the lowest and highest cost of any one repair in the data frame?

