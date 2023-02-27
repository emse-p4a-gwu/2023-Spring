library(stringr)

# ------------------------------------------------
# Quick practice 1:

x <- 'thisIsGoodPractice'

# Use **stringr** functions to transform x into the
# following strings:

# 'thisIsGood'

# 'practice'

# 'GOOD'

# 'thisthisthis'

# 'GOODGOODGOOD'


# **Hint**: You'll need these:
# str_to_lower()
# str_to_upper()
# str_locate()
# str_sub()
# str_dup()








# ------------------------------------------------
# Quick practice 2:

# Create the following objects:
x <- 'this_is_good_practice'
y <- c('hello', 'world')

# Use stringr functions to transform x and y into the following:

# "hello world"

# "***hello world***"

# c("this", "is", "good", "practice")

# "this is good practice"

# "hello world, this is good practice"

# **Hint**: You'll need these:
# str_trim()
# str_pad()
# paste()
# str_split()





# ------------------------------------------------
# Your turn 1:

# 1) reverseString(s): Write a function that returns the
#    string s in reverse order.

test_reverseString <- function() {
    cat("Testing reverseString()...")
    stopifnot(reverseString("aWordWithCaps") == "spaChtiWdroWa")
    stopifnot(reverseString("abcde") == "edcba")
    stopifnot(reverseString("") == "")
    cat("Passed!\n")
}

reverseString <- function(s) {
    # Write code here
}

test_reverseString()

# 2) isPalindrome(s): Write a function that returns TRUE if
#    the string s is a Palindrome and FALSE otherwise.

test_isPalindrome <- function() {
    cat("Testing isPalindrome()...")
    stopifnot(isPalindrome("abcba") == TRUE)
    stopifnot(isPalindrome("abcb") == FALSE)
    stopifnot(isPalindrome("321123") == TRUE)
    cat("Passed!\n")
}

isPalindrome <- function(s) {
    # Write code here
}

test_isPalindrome()


# ------------------------------------------------
# Quick practice 3:

# Use stringr functions to answer the following questions
# about the  fruit vector:

# 1. How many fruit have the string "rr" in it?

# 2. Which fruit end with string "fruit"?

# 3. Which fruit contain more than one "o" character?






# ------------------------------------------------
# Your turn 2:


# 1) sortString(s): Write the function sortString(s) that takes
#    a string s and returns back an alphabetically sorted string.

test_sortString <- function() {
    cat("Testing sortString()...")
    stopifnot(sortString("cba") == "abc")
    stopifnot(sortString("abedhg") == "abdegh")
    stopifnot(sortString("AbacBc") == "aAbBcc")
    cat("Passed!\n")
}

sortString <- function(s) {
    # Write code here
}

test_sortString()

# 2) areAnagrams(s1, s2): Write the function areAnagrams(s1, s2) that
#    takes two strings, s1 and s2, and returns TRUE if the strings are
#    anagrams and FALSE otherwise. **Treat lower and upper case as the
#    same letters**.

test_areAnagrams <- function() {
    cat("Testing areAnagrams()...")
    stopifnot(areAnagrams("", "") == TRUE)
    stopifnot(areAnagrams("aabbccdd", "bbccddee") == FALSE)
    stopifnot(areAnagrams("TomMarvoloRiddle", "IAmLordVoldemort") == TRUE)
    cat("Passed!\n")
}

areAnagrams <- function(s1, s2) {
    # Write code here
}

test_areAnagrams()
