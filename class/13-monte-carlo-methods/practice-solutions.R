library(tidyverse)

# Practice 1: Coins & Dice  ----------------------------

# If you flipped a coin 3 times in a row, what is the probability that
# you'll get three "tails" in a row?

coin <- c("heads", "tails")
N <- 100000

rolls <- tibble(
  toss1 = sample(x = coin, size = N, replace = TRUE),
  toss2 = sample(x = coin, size = N, replace = TRUE),
  toss3 = sample(x = coin, size = N, replace = TRUE))

count <- rolls %>%
  filter(toss1 == 'tails', toss2 == 'tails', toss3 == 'tails') %>%
  nrow()

count / N

# Analytic solution:
(0.5)^3


# If you rolled 2 dice, what is the probability that you'll get
# "snake-eyes" (two 1's)?

dice <- c(1, 2, 3, 4, 5, 6)
N <- 100000
rolls <- tibble(
  roll1 = sample(x = dice, size = N, replace = TRUE),
  roll2 = sample(x = dice, size = N, replace = TRUE))

count <- rolls %>%
  filter(roll1 == 1, roll2 == 1) %>%
  nrow()

count / N

# Analytic solution:
(1/6)^2


# If you rolled 2 dice, what is the probability that you'll get an outcome
# that sums to 8?

count <- rolls %>%
  mutate(sum = roll1 + roll2) %>%
  filter(sum == 8) %>%
  nrow()

count / N



# Practice 2: Cards  ----------------------------

# What are the odds that four cards drawn from a 52-card deck will
# have the same suit?

suits <- c('diamonds', 'spades', 'hearts', 'clubs')
deck <- rep(suits, 13)

N <- 100000
count <- 0
for (i in 1:N) {
  cards = sample(x = deck, size = 4, replace = FALSE)
  if (length(unique(cards)) == 1) {
    count <- count + 1
  }
}

count / N

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

deck <- rep(c(seq(10), 10, 10, 10), 4)
N <- 100000

count <- 0

for (i in 1:N) {
  cards = sample(x = deck, size = 5, replace = FALSE)
  sumOfCards <- sum(cards)
  if (isPrime(sumOfCards)) {
    count <- count + 1
  }
}

count / N


# Practice 3: Monte Carlo pi ----------------------------

# 1. Create a tibble with variables x and y that each contain 10,000
#    random points between -1 and 1, representing the (x, y) coordinates
#    to a random point inside a square of side length 2 centered at
#    (x, y) = (0, 0).
#    **Hint**: use runif()

N <- 10000
points <- tibble(
  x = runif(N, min = -1, max = 1),
  y = runif(N, min = -1, max = 1)
)

# 2. Create a new column, radius, that is equal to the distance to each
#    (x, y) point from the center of the square.

# 3. Create a new column, pointInCircle, that is TRUE if the point
#    lies _within_ the circle inscribed in the square, and FALSE otherwise.

points <- points %>%
  mutate(
    radius = sqrt(x^2 + y^2),
    pointInCircle = radius <= 1
  )

# 4. Create the scatterplot on the left (don't worry about the precise
#    colors, dimensions, etc.).

ggplot(data = points) +
  geom_point(aes(x = x, y = y, color = pointInCircle), size = 0.1) +
  theme_minimal() +
  scale_color_manual(values = c('red', 'blue'))

# 5. Estimate $\pi$ by multiplying 4 times the ratio of points inside
#    the circle to the total number of points

areaRatio <- sum(points$pointInCircle) / N
pi_est <- 4*areaRatio

pi_est

pi



# Practice 4: Monte Hall Problem ----------------------------

# In this simulation, the prize is always behind door #1:

# - If you choose door #1, you must KEEP it to win.
# - If you choose door #2 or #3, you must SWAP to win.

# 1) Create the tibble, choices, with two variables:
#    - door contains the first door chosen (1, 2, or 3)
#    - swap contains a logical (TRUE or FALSE) for whether the
#      contestant swaps doors. **Hint**: use sample()

choices <- tibble(
  door = sample(x = c(1, 2, 3), size = N, replace = TRUE),
  swap = sample(x = c(TRUE, FALSE), size = N, replace = TRUE))

# 2) Create a new tibble, wins, which contains only the rows from
#    choices that resulted in a win.

wins <- choices %>%
  filter((door == 1) & (swap == FALSE) |
         (door != 1) & (swap == TRUE))

# 3) Compute the percentage of times the contestant won after swapping doors.

sum(wins$swap) / nrow(wins)
