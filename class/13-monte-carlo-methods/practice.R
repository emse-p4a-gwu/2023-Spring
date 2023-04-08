library(tidyverse)

# Practice 1: Coins & Dice  ----------------------------

# If you flipped a coin 3 times in a row, what is the probability that
# you'll get three "tails" in a row?


# If you rolled 2 dice, what is the probability that you'll get
# "snake-eyes" (two 1's)?


# If you rolled 2 dice, what is the probability that you'll get an outcome
# that sums to 8?




# Practice 2: Cards  ----------------------------

# What are the odds that four cards drawn from a 52-card deck will
# have the same suit?


# What are the odds that five cards drawn from a 52-card deck will sum
# to a prime number? 
# 
# - Aces = 1
# - Jack = 10
# - Queen = 10
# - King = 10
#
# **Hint**: use isPrime() to help.

isPrime <- function(n) {
    if (n == 2) { return(TRUE) }
    for (i in seq(2, n-1)) {
        if (n %% i == 0) {
            return(FALSE)
        }
    }
    return(TRUE)
}




# Practice 3: Monte Carlo pi ----------------------------

# 1. Create a tibble with variables x and y that each contain 10,000
#    random points between -1 and 1, representing the (x, y) coordinates
#    to a random point inside a square of side length 2 centered at
#    (x, y) = (0, 0).
#    **Hint**: use runif()


# 2. Create a new column, radius, that is equal to the distance to each
#    (x, y) point from the center of the square.


# 3. Create a new column, pointInCircle, that is TRUE if the point
#    lies _within_ the circle inscribed in the square, and FALSE otherwise.


# 4. Create the scatterplot on the left (don't worry about the precise
#    colors, dimensions, etc.).


# 5. Estimate $\pi$ by multiplying 4 times the ratio of points inside
#    the circle to the total number of points




# Practice 4: Monte Hall Problem ----------------------------

# In this simulation, the prize is always behind door #1:

# - If you choose door #1, you must KEEP it to win.
# - If you choose door #2 or #3, you must SWAP to win.

# 1) Create the tibble, choices, with two variables:
#    - door contains the first door chosen (1, 2, or 3)
#    - swap contains a logical (TRUE or FALSE) for whether the
#      contestant swaps doors. **Hint**: use sample()


# 2) Create a new tibble, wins, which contains only the rows from
#    choices that resulted in a win.


# 3) Compute the percentage of times the contestant won after swapping doors.

