
# ------------------------------------------------
# Practice 1: Code tracing

# Consider these functions:
f1 <- function(x) {
    return(x^3)
}
f2 <- function(x) {
    cat(x^3)
}
f3 <- function(x) {
    cat(x^3)
    return(x^4)
}
f4 <- function(x) {
    return(x^3)
    cat(x^4)
}

# What will these lines of code produce?
# Write your answer down first, *then* run the code to check:
f1(2)
f2(2)
f3(2)
f4(2)



# ------------------------------------------------
# Practice 2: Code tracing

# Consider this code:
x <- 7
y <- NULL
f1 <- function(x) {
    cat(x^3)
    cat(y, x, sep="")
}
f2 <- function(x, y = 7) {
    cat(x^3, y)
}
f3 <- function(x, y) {
    cat(x^3)
    cat(y)
}
f4 <- function(x) {
    return(x^3)
    cat(x^4)
}

# What will these lines of code produce?
# Write your answer down first, _then_ run the code to check:
f1(2)
f2(2)
f3(2)
f4(2)



# ------------------------------------------------
# Practice 3: Write functions

# Create a function, `isRightTriangle(a, b, c)` that returns `TRUE`
# if the triangle formed by the lines of length `a`, `b`, and `c` is a right
# triangle and `FALSE` otherwise. Use the `hypotenuse(a, b)` function in
# your solution. **Hint**: you may not know which value (`a`, `b`, or `c`)
# is the hypotenuse.

hypotenuse <- function(a, b) {
    return(sqrt(sumOfSquares(a, b)))
}

sumOfSquares <- function(a, b) {
    return(a^2 + b^2)
}

isRightTriangle <- function(a, b, c) {
    test1 <- c == hypotenuse(a, b)
    test2 <- b == hypotenuse(a, c)
    test3 <- a == hypotenuse(c, b)
    return(test1 | test2 | test3)
}


# ------------------------------------------------
# Practice 4: Write functions

# `onesDigit(x)`: Write a function that takes an integer and
# returns its ones digit.

onesDigit <- function(x) {
    return(abs(x) %% 10)
}

# Tests:
onesDigit(123) == 3
onesDigit(7890) == 0
onesDigit(6) == 6
onesDigit(-54) == 4
onesDigit(0) == 0


# `tensDigit(x)`: Write a function that takes an integer and returns
# its tens digit.

tensDigit <- function(x) {
    # Shift x over one place
    y <- abs(x) %/% 10
    # use onesDigit
    return(onesDigit(y))
}

# Tests:
tensDigit(456) == 5
tensDigit(23) == 2
tensDigit(1) == 0
tensDigit(-7890) == 9
tensDigit(-11) == 1



# ------------------------------------------------
# Practice 5: Write functions

# `eggCartons(eggs)`: Write a function that takes a non-negative
# number of eggs and returns the number of egg cartons required to hold
# that many eggs. Each egg carton holds one dozen eggs, and you cannot
# buy fractional egg cartons.

eggCartons <- function(eggs) {
    return(ceiling(eggs / 12))
}

# Tests:
eggCartons(0) == 0
eggCartons(1) == 1
eggCartons(12) == 1
eggCartons(25) == 3

# `militaryTimeToStandardTime(n)`: Write a function that takes an
# integer between 0 and 23 (representing the hour in military time),
# and returns the same hour in standard time.

# Plan: Start with x %% 12, then guess and check to modify

# Make a table of x %% 12:
# 1  %% 12 == 1
# 11 %% 12 == 11
# 12 %% 12 == 0
# 13 %% 12 == 1
# 23 %% 12 == 11

# Make a table of ((x - 1) %% 12):
# 1  %% 12 == 0
# 11 %% 12 == 10
# 12 %% 12 == 11
# 13 %% 12 == 0
# 23 %% 12 == 10

militaryTimeToStandardTime <- function(x) {
    y <- (x - 1) %% 12
    return(y + 1)
}

# Tests:
militaryTimeToStandardTime(0) == 12
militaryTimeToStandardTime(3) == 3
militaryTimeToStandardTime(12) == 12
militaryTimeToStandardTime(13) == 1
militaryTimeToStandardTime(23) == 11
