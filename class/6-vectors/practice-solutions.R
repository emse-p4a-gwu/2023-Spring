# ------------------------------------------------
# Quick code tracing 1

rep(c(TRUE, FALSE, "TRUE"), 2)

seq(FALSE, 3)

rep(c(seq(3), seq(2)), each = 2)





# ------------------------------------------------
# Quick code tracing 2

f <- function(x) {
    m <- x
    n <- sum(x + 4)
    m <- m + 5
    return(c(m, n))
}

# What will this return?

x <- c(1, 3)
f(x)

y <- c(TRUE, FALSE, 1)
f(y)






# ------------------------------------------------
# Practice 1

# Re-write isPrime(n) from last week, but **without loops!**.
# Remember, isPrime(n) takes a non-negative integer, n, and
# returns TRUE if it is a prime number and FALSE otherwise.

test_isPrime <- function() {
    cat("Testing isPrime()...")
    stopifnot(isPrime(1) == FALSE)
    stopifnot(isPrime(2) == TRUE)
    stopifnot(isPrime(7) == TRUE)
    stopifnot(isPrime(13) == TRUE)
    stopifnot(isPrime(14) == FALSE)
    cat("Passed!")
}

# Loop solution

isPrime <- function(n) {
    if (n <= 1) {
        return(FALSE)
    }
    if (n == 2) {
        return(TRUE)
    }
    for (i in seq(2, n - 1)) {
        if ((n %% i) == 0) {
            return(FALSE)
        }
    }
    return(TRUE)
}

test_isPrime()

# Vector solution 1

isPrime <- function(n) {
    if (n <= 1) {
        return(FALSE)
    }
    if (n == 2) {
        return(TRUE)
    }
    test <- (n %% (seq(2, n - 1))) == 0
    if (any(test)) {
        return(FALSE)
    }
    return(TRUE)
}

test_isPrime()

# Vector solution 2

isPrime <- function(n) {
    if (n <= 1) {
        return(FALSE)
    }
    if (n == 2) {
        return(TRUE)
    }
    x <- seq(2, n - 1) # Checking each number from 2 to n-1
    y <- n %% x # Compute remainders
    if (any(y == 0)) {
        return(FALSE)
    }
    return(TRUE)
}

test_isPrime()





# ------------------------------------------------
# Quick code tracing 3

f <- function(x) {
    for (i in seq(length(x))) {
        x[i] <- x[i] + sum(x) + max(x)
    }
    return(x)
}

# What will this return?

x <- c(1, 2, 3)
f(x)

# Main: x <- c(10, 27, 70)

c(10, 27, 70)




# ------------------------------------------------
# Practice 2

# 1) reverse(x): Write a function that returns the vector
# in reverse order. You cannot use the rev() function.

test_reverseVector <- function() {
    cat("Testing reverseVector()...")
    stopifnot(all(reverseVector(c(5, 1, 3)) == c(3, 1, 5)))
    stopifnot(all(reverseVector(c('a', 'b', 'c')) == c('c', 'b', 'a')))
    stopifnot(all(reverseVector(c(FALSE, TRUE, TRUE)) == c(TRUE, TRUE, FALSE)))
    cat("Passed!")
}

# Loop solution

reverseVector <- function(x) {
    y <- x
    for(i in 1:length(x)) {
        y[i] <- x[length(x) - i + 1]
    }
    return(y)
}

test_reverseVector()

# Vector solution

reverseVector <- function(x) {
    indices <- seq(length(x), 1, by = -1)
    return(x[indices])
}

test_reverseVector()




# 2) alternatingSum(a): Write a function that takes a vector
# of numbers a and returns the alternating sum, where the
# sign alternates from positive to negative or vice versa.

test_alternatingSum <- function() {
    cat("Testing alternatingSum()...")
    stopifnot(alternatingSum(c(5,3,8,4)) == (5 - 3 + 8 - 4))
    stopifnot(alternatingSum(c(1,2,3)) == (1 - 2 + 3))
    stopifnot(alternatingSum(c(0,0,0)) == 0)
    stopifnot(alternatingSum(c(-7,5,3)) == (-7 - 5 + 3))
    cat("Passed!")
}

# Loop solution

alternatingSum <- function(a) {
    total <- 0
    for (i in 1:length(a)) {
        if ((i %% 2) == 1) {
            total <- total + a[i]
        } else {
            total <- total - a[i]
        }
    }
    return(total)
}

test_alternatingSum()

# Vector solution

alternatingSum <- function(a) {
    ones <- rep(c(1, -1), length(a))
    ones <- ones[1:length(a)]
    return(sum(ones*a))
}

test_alternatingSum()

