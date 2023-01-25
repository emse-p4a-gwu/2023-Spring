# ------------------------------------------------
# Practice 1: Functions

# Block 1:
val <- abs(x <- sqrt(10))
result <- round(val, digits <- sqrt(10))
answer <- x*digits
answer

# Block 2:
val <- sqrt(abs(min(-42, -64, 81)))
result <- floor(y = min(val, log(10)))
answer <- result*val
answer

# Follow these steps:

# 1. Don't run the code (yet)!
# 2. Write down out what you expect R will return when these lines are run in sequence.
# 3. Compare your expectations with each other.
# 4. Run the code and compare the results with your expectations.


# NOTES:
# Work backwards from the "inside out" to simplify each line of code.
# Be careful that:
# - The usage of the "<-" operator also creates a "global" variable
# - The argument names may not be correct!



# ------------------------------------------------
# Practice 2: Data types


number    <- as.logical(as.numeric('3'))
character <- is.character(typeof(7))
true      <- as.logical("FALSE")
false     <- as.logical(as.numeric(TRUE))

! (number == character) & (true | false) | (number & false)

# Follow these steps:

# 1. Don't run the code (yet)!
# 2. Write down out what you expect R will return when these lines are run in sequence.
# 3. Compare your expectations with each other.
# 4. Run the code and compare the results with your expectations.


# NOTES:
# Work backwards from the "inside out" to simplify each line of code.
# Be careful that:

number    <- TRUE
character <- TRUE
true      <- FALSE
false     <- TRUE

! (number == character) & (true | false) | (number & false)

# Simplifies to:

! TRUE & TRUE | TRUE

# Simplifies to:

FALSE & TRUE | TRUE

# Simplifies to:

FALSE | TRUE


# ------------------------------------------------
# Practice 3: Packages

# 1. Install the "TurtleGraphics" package.
# 2. Restart RStudio.
# 3. Load the "TurtleGraphics" package.
# 4. Use the "turtle_init()" function to create a turtle.
# 5. Use 'help(package = "TurtleGraphics")' to learn about other functions to control your turtle.
# 6. Try drawing this shape with your turtle<br>(hint: the length of each line is 50 units).
# 7. Compare your results and code with each other.

library(TurtleGraphics)
turtle_init()
turtle_move(distance = 25, direction = 'forward')
turtle_move(distance = 50, direction = 'backward')
turtle_forward(25)
turtle_turn(90, direction = 'left')
turtle_move(distance = 25, direction = 'forward')
turtle_move(distance = 50, direction = 'backward')
turtle_forward(25)
turtle_reset()






# ------------------------------------------------
# Practice 4: Polya's problem solving technique

# Polya practice 1: What's your degree worth?

# In the U.S., the average annual salary of a high school graduate is $35,256,
# and the average salary of a GW graduate is $76,151. However, GW grads pay an
# average of $70,000 / year (tuition + fees + housing) for 4 years for their
# degree, and high school grads are working that entire time.

# Assuming immediate employment after graduation, how many years after
# graduating will the GW grad need to work until their net income (salary minus
# cost of education) surpasses that of the average high school graduate?



# Step 1: Understand the problem
# Restate the problem: How many years after graduating will a GW grad's net
# income surpass that of a high school grad, accounting for added cost of
# education?

# Step 2: Devise a plan:

# - Find income gap when gw grad starts
# - Find the annual salary surplus of gw grad compared to hs grad
# - Divide annual income surplus into income starting gap

# Step 3: Carry out plan:

# Known values
salary_hs <- 35256
salary_gw <- 76151
gw_annual_cost <- 70000
years_in_college <- 4

# Cost of education + 4 years hs grad salary
income_gap_start <- years_in_college*(salary_hs + gw_annual_cost)

# Find the annual salary surplus of gw grad compared to hs grad
gw_annual_surplus <- salary_gw - salary_hs

# Divide annual income surplus into income starting gap
ceiling(income_gap_start / gw_annual_surplus)

# Step 4: Check your work 

# Check intermediate values
income_gap_start
gw_annual_surplus

# Can we ask a different question?
# What would my salary need to be to cut that to just 5 years?
(income_gap_start / 5) + salary_hs



# Polya practice 2: Prius vs. Camry

# Kevin is deciding between purchasing a Toyota Prius, which sells for $27,600,
# and a Toyota Camry, which sells for $24,000. He knows he can get an average
# fuel economy of 55 miles per gallon (mpg) in the Prius but only 28 mpg in the
# Camry on average. He also knows that he typically drives 12,000 miles each
# year, and the average price of gasoline is $3.00 / gallon.

# How long (in years) would Kevin have to drive the Prius for the money he saves
# in fuel savings to be greater than the price premium compared to the Camry?


# Step 1: Understand the problem

# Restate the problem:
# How much does Kevin save in fuel each year if he purchased the Prius, and
# when do these savings surpass the price premium for the Prius?

# Step 2: Devise a plan:

# - Compute the price premium for the Prius
# - Compute annual gallons consumed for each car
# - Compute annual fuel cost savings from Prius
# - Divide fuel savings into price premium

# Step 3: Carry out plan:

# Known values
price_camry <- 24000
price_prius <- 27600
mpg_camry   <- 28    # Mpg = miles per gallon
mpg_prius   <- 55
annual_miles <- 12000 # miles
price_gas <- 3.00 # per gallon

# Compute the price premium for the Prius
price_premium <- price_prius - price_camry

# Compute annual gallons consumed for each car
annual_gallons_prius <- annual_miles / mpg_prius
annual_gallons_camry <- annual_miles / mpg_camry

# Compute annual fuel cost savings from Prius
annual_fuelcost_prius <- annual_gallons_prius*price_gas
annual_fuelcost_camry <- annual_gallons_camry*price_gas
annual_fuel_savings <- annual_fuelcost_camry - annual_fuelcost_prius

# Divide fuel savings into price premium
price_premium / annual_fuel_savings

# Step 4: Check your work 

# Check intermediate values
annual_gallons_prius
annual_gallons_camry
annual_fuelcost_prius
annual_fuelcost_camry
annual_fuel_savings

# Can we ask a different question?
# What would the price of gas need to be to get that down to 2 years?
annual_gallons_diff <- annual_gallons_camry - annual_gallons_prius
(price_premium / 2) / annual_gallons_diff
