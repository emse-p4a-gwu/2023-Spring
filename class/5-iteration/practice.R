
# ------------------------------------------------
# Code tracing quick practice 

for (i in 1:5) {
    if ((i %% 2) == 0) {
        cat('--')
    } else if ((i %% 3) == 0) {
        cat('----')
    }
    cat(i, '\n')
}

n <- 6
for (i in seq(n)) {
    cat('|')
    for (j in seq(1, n, 2)) {
        cat('*')
    }
    cat('|', '\n')
}


# ------------------------------------------------
# Practice 1: for loops

# 1) sumFromMToN(m, n): Write a function that sums the total
#    of the integers between m and n. 
#    *Challenge*: Try solving this without a loop!

test_sumFromMToN <- function() {
    cat("Testing sumFromMToN()...")
    stopifnot(sumFromMToN(1, 5) == 1 + 2 + 3 + 4 + 5)
    stopifnot(sumFromMToN(5, 10) == (5 + 6 + 7 + 8 + 9 + 10))
    stopifnot(sumFromMToN(1, 1) == 1)
    cat("Passed!")
}

sumFromMToN <- function(m, n) {
    return(42) # Replace with your code
}

test_sumFromMToN()



# 2) sumEveryKthFromMToN(m, n, k): Write a function to sum every kth integer 
#    from m to n.

test_sumEveryKthFromMToN <- function() {
    cat("Testing sumEveryKthFromMToN()...")
    stopifnot(sumEveryKthFromMToN(1, 10, 2) == (1 + 3 + 5 + 7 + 9))
    stopifnot(sumEveryKthFromMToN(5, 20, 7) == (5 + 12 + 19))
    stopifnot(sumEveryKthFromMToN(0, 0, 1) == 0)
    cat("Passed!")
}

sumEveryKthFromMToN <- function(m, n, k) {
    return(42) # Replace with your code
}

test_sumEveryKthFromMToN()



# 3) sumOfOddsFromMToN(m, n): Write a function that sums
#    every *odd* integer between m and n.

test_sumOfOddsFromMToN <- function() {
    cat("Testing sumOfOddsFromMToN()...")
    stopifnot(sumOfOddsFromMToN(4, 10) == (5 + 7 + 9))
    stopifnot(sumOfOddsFromMToN(5, 9) == (5 + 7 + 9))
    cat("Passed!")
}

sumOfOddsFromMToN <- function(m, n) {
    return(42) # Replace with your code
}

test_sumOfOddsFromMToN()


# ------------------------------------------------
# Code tracing quick practice 

for (i in 1:3) {
    cat('|')
    for (j in 1:5) {
        if (j == 3) {
            break
        }
        cat('*')
    }
    cat('|', '\n')
}


for (i in 1:3) {
    cat('|')
    for (j in 1:5) {
        if (j == 3) {
            next
        }
        cat('*')
    }
    cat('|', '\n')
}




# ------------------------------------------------
# Practice 2: break and next

# sumOfOddsFromMToNMax(m, n, max): Write a function that sums every odd
# integer from m to n up until the sum is less than or equal to the value
# max. Your solution **must** use both break and next statements.

test_sumOfOddsFromMToNMax <- function() {
    cat("Testing sumOfOddsFromMToNMax()...")
    stopifnot(sumOfOddsFromMToNMax(1, 5, 4) == (1 + 3))
    stopifnot(sumOfOddsFromMToNMax(1, 5, 3) == (1))
    stopifnot(sumOfOddsFromMToNMax(1, 5, 10) == (1 + 3 + 5))
    cat("Passed!")
}

sumOfOddsFromMToNMax <- function(m, n, max) {
    return(42) # Replace with your code
}

test_sumOfOddsFromMToNMax()



# ------------------------------------------------
# Code tracing quick practice 

f <- function(x) {
    n <- 1
    while (n < x) {
        cat(n, '\n')
        n <- 2*n
    }
}

f(5)
f(10)
f(50)
f(60)
f(64)
f(65)


# ------------------------------------------------
# Practice 3: while loops

# The function `isMultipleOf4Or7(n)` returns `TRUE` if `n` is a 
# multiple of 4 or 7 and `FALSE` otherwise.

test_isMultipleOf4Or7 <- function() {
    cat("Testing isMultipleOf4Or7()...")
    stopifnot(isMultipleOf4Or7(0) == FALSE)
    stopifnot(isMultipleOf4Or7(1) == FALSE)
    stopifnot(isMultipleOf4Or7(4) == TRUE)
    stopifnot(isMultipleOf4Or7(7) == TRUE)
    stopifnot(isMultipleOf4Or7(28) == TRUE)
    cat("Passed!")
}

isMultipleOf4Or7 <- function(n) {
    if (n == 0) { return(FALSE) }
    return((n %% 4 == 0) | (n %% 7 == 0))
}

test_isMultipleOf4Or7()


# nthMultipleOf4Or7(n): Write a function that returns the
# nth positive integer that is a multiple of either 4 or 7.

test_nthMultipleOf4Or7 <- function() {
    cat("Testing nthMultipleOf4Or7()...")
    stopifnot(nthMultipleOf4Or7(1) == 4)
    stopifnot(nthMultipleOf4Or7(2) == 7)
    stopifnot(nthMultipleOf4Or7(3) == 8)
    stopifnot(nthMultipleOf4Or7(4) == 12)
    stopifnot(nthMultipleOf4Or7(5) == 14)
    stopifnot(nthMultipleOf4Or7(6) == 16)
    cat("Passed!")
}

nthMultipleOf4Or7 <- function(n) {
    return(42) # Replace with your code
}

test_nthMultipleOf4Or7()


# ------------------------------------------------
# Practice 4: prime numbers

# 1) isPrime(n): Write a function that takes a non-negative
#    integer, n, and returns TRUE if it is a prime number and
#    FALSE otherwise. Here's some test cases:

test_isPrime <- function() {
    cat("Testing isPrime()...")
    stopifnot(isPrime(1) == FALSE)
    stopifnot(isPrime(2) == TRUE)
    stopifnot(isPrime(7) == TRUE)
    stopifnot(isPrime(13) == TRUE)
    stopifnot(isPrime(14) == FALSE)
    cat("Passed!")
}

isPrime <- function(n) {
    return(42) # Replace with your code
}

test_isPrime()



# 2) nthPrime(n): Write a function that takes a non-negative
#    integer, n, and returns the nth prime number, where nthPrime(1)
#    returns the first prime number (2). Hint: use the function
#    isPrime(n) as a helper function!

test_nthPrime <- function() {
    cat("Testing nthPrime()...")
    stopifnot(nthPrime(1) == 2)
    stopifnot(nthPrime(2) == 3)
    stopifnot(nthPrime(3) == 5)
    stopifnot(nthPrime(4) == 7)
    stopifnot(nthPrime(7) == 17)
    cat("Passed!")
}

nthPrime <- function(n) {
    return(42) # Replace with your code
}

test_nthPrime()
