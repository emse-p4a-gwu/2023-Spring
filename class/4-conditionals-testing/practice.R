# ------------------------------------------------
# Practice 1: absValue(n)

# Write the function absValue(n) that returns the absolute
# value of a number (and no cheating - you can't use the
# built-in abs() function!)

absValue <- function(n) {

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

getType <- function(x) {

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

}

isFactor <- function(f, n) {

}

test_isFactor()



# 2) Write the function isMultiple(m, n) that takes two integer values and
# returns TRUE if m is a multiple of n and FALSE otherwise. Note that
# 0 is a multiple of every integer other than itself. Hint: You may want to
# use the isFactor(f, n) function you just wrote above. Assume m and n
# will only be numeric values.


test_isMultiple <- function() {

}

isMultiple <- function(m, n) {

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

}

getInRange <- function(x, bound1, bound2) {

}

test_getInRange()
