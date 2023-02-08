# ------------------------------------------------
# Practice 1: absValue(n)

# Write the function absValue(n) that returns the absolute
# value of a number (and no cheating - you can't use the
# built-in abs() function!)

# Many ways to do this:

absValue <- function(n) {
    if (n < 0) {
        n <- -1*n
    }
    return(n)
}

absValue <- function(n) {
    if (n < 0) {
        return(-1*n)
    }
    return(n)
}

absValue <- function(n) {
    if (n >= 0) {
        return(n)
    }
    return(-1*n)
}

# Tests:
absValue(7) == 7
absValue(-7) == 7
absValue(0) == 0

# ------------------------------------------------
# Practice 2: getType(x)

# Write the function getType(x) that returns the type of the data
# (either integer, double, character, or logical). Basically,
# it does the same thing as the typeof() function (but you can't use
# typeof() in your solution).

# Solution using multiple return statements
getType <- function(x) {
    if (is.integer(x)) {
        return("integer")
    } else if (is.double(x)) {
        return("double")
    } else if (is.character(x)) {
        return("character")
    }
    return("logical")
}

# Solution using single return statement
getType <- function(x) {
    if (is.integer(x)) {
        type <- "integer"
    } else if (is.double(x)) {
        type <- "double"
    } else if (is.character(x)) {
        type <- "character"
    } else {
        type <- "logical"
    }
    return(type)
}

# Tests:
getType(3) == "double"
getType(3L) == "integer"
getType("foo") == "character"
getType(TRUE) == "logical"

# ------------------------------------------------
# Practice 3: isFactor(f, n) & isMultiple(m, m)

# For each of the following functions, start by writing a test
# function that tests the function for a variety of values of inputs.
# Consider cases that you might not expect!

# 1) Write the function isFactor(f, n) that takes two integer values and
# returns TRUE if f is a factor of n, and FALSE otherwise (e.g. 2 is a
# factor of 6). Note that every integer is a factor of 0. Assume f and n
# will only be numeric values.

# Consider NOLES:
#
# Normal
# Opposite
# Large / small
# Edge
# Special

test_isFactor <- function() {
    cat("Testing isFactor()...")
    stopifnot(isFactor(2, 6) == TRUE)
    stopifnot(isFactor(6, 2) == FALSE)
    stopifnot(isFactor(0, 2) == FALSE)
    stopifnot(isFactor(2, 0) == TRUE)
    cat("Passed! Woohoo!")
}

isFactor <- function(f, n) {
    if (f == 0) {
        return(FALSE)
    }
    if (n == 0) {
        return(TRUE)
    }
    return((n %% f) == 0)
}

test_isFactor()



# 2) Write the function isMultiple(m, n) that takes two integer values and
# returns TRUE if m is a multiple of n and FALSE otherwise. Note that
# 0 is a multiple of every integer other than itself. Hint: You may want to
# use the isFactor(f, n) function you just wrote above. Assume m and n
# will only be numeric values.


test_isMultiple <- function() {
    cat("Testing isMultiple()...")
    stopifnot(isMultiple(2, 6) == FALSE)
    stopifnot(isMultiple(6, 2) == TRUE)
    stopifnot(isMultiple(0, 2) == TRUE)
    stopifnot(isMultiple(2, 0) == FALSE)
    cat("Passed! Woohoo!")
}

isMultiple <- function(m, n) {
    return(isFactor(n, m))
}

test_isMultiple()

# ------------------------------------------------
# Practice 4: getInRange(x, bound1, bound2)

# Write the function `getInRange(x, bound1, bound2)` which takes 3 numeric
# values: `x`, `bound1`, and `bound2`. `bound1` is not necessarily less than
# `bound2`. If `x` is between the two bounds, return `x`, but if `x` is less
# than the lower bound, return the lower bound, or if `x` is greater than the
# upper bound, return the upper bound. For example:
#
# - `getInRange(1, 3, 5)` returns `3` (the lower bound, since 1 is below [3,5])
# - `getInRange(4, 3, 5)` returns `4` (the original value, since 4 is between
# [3,5]) - `getInRange(6, 3, 5)` returns `5` (the upper bound, since 6 is above
# [3,5]) - `getInRange(6, 5, 3)` returns `5` (the upper bound, since 6 is above
# [3,5])
#
# You should also write a test function called `test_getInRange()`.
#
# **Bonus**: 
# Try writing `getInRange(x, bound1, bound2)` without using `if` or `else`

test_getInRange <- function() {
    cat('Testing getInRange()...')
    stopifnot(getInRange(1, 3, 5) == 3)
    stopifnot(getInRange(4, 3, 5) == 4)
    stopifnot(getInRange(6, 3, 5) == 5)
    stopifnot(getInRange(6, 5, 3) == 5)
    cat('Passed!')
}

getInRange <- function(x, bound1, bound2) {
    lower <- min(bound1, bound2)
    upper <- max(bound1, bound2)
    if (x < lower) {
        return(lower)
    }
    if (x > upper) {
        return(upper)
    }
    return(x)
}

test_getInRange()


# Solution with no conditionals:
getInRange <- function(x, bound1, bound2) {
    lower <- min(bound1, bound2)
    upper <- max(bound1, bound2)
    return(min(max(x, lower), upper))
}

test_getInRange()
