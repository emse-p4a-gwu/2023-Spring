library(tidyverse)
library(here)

birds <- read_csv(here('data', 'wildlife_impacts.csv'))
bears <- read_csv(here('data', 'bear_killings.csv'))

# Practice 1 ----------------------------------------

# Does the annual number of bird impacts appear to be changing over time?
# Make a plot using the birds data frame to justify your answer
# Hint: You may need to create a summary data frame to answer this question!
# Bonus points: Make your plot pretty

glimpse(birds)

# version 1
annualCount <- birds %>% 
    group_by(incident_year) %>% 
    summarise(count = n())

plot(annualCount$incident_year, annualCount$count, col = 'red')

# version 2
annualCount <- birds %>% 
    count(incident_year)

plot(annualCount$incident_year, annualCount$n, col = 'red')


# Practice 2 ----------------------------------------

# Make plots using the birds data frame to answer these questions

# Which months have the highest and lowest number of bird
# impacts in the dataset?

hist(birds$incident_month, breaks = 12)

birds %>% 
    count(incident_month) %>% 
    arrange(desc(n))

# Which aircrafts experience more impacts: 2-engine, 3-engine, or 4-engine?

hist(birds$num_engs)

# At what height do most impacts occur?

hist(birds$height, breaks = 100)

birdsUnder5000 <- birds %>% 
    filter(height < 5000)
hist(birdsUnder5000$height, breaks = 100)

# Bonus points: Make your plots pretty






# Practice 3 ----------------------------------------

# Use the birds data frame to create the following plots

# Plot 1
ggplot(
    data = birds,
    mapping = aes(x = cost_repairs_infl_adj, y = height)) +
    geom_point()

ggplot(data = birds) + 
    geom_point(
        mapping = aes(x = cost_repairs_infl_adj, y = height))

# Plot2

ggplot(data = birds) + 
    geom_point(
        mapping = aes(
            x = speed, y = height,
            color = str_to_lower(phase_of_flt)))

ggplot(
    data = birds,
    mapping = aes(x = speed, y = height)) +
    geom_point(aes(color = str_to_lower(phase_of_flt)))

# Practice 4 ----------------------------------------

# Use the bears and birds data frame to create the following plots

# Plot 1 
bears %>% 
    count(year, gender) %>% 
    ggplot() + 
    geom_col(aes(x = year, y = n, fill = gender)) + 
    labs(
        x = "Year", y = "Number of victims",
        fill = "Victim gender",
        title = "Foo"
    )

# Plot 2
birds %>% 
    filter(!is.na(cost_repairs_infl_adj)) %>% 
    group_by(incident_year) %>% 
    summarise(maxCost = max(cost_repairs_infl_adj)) %>%
    ggplot() +
    geom_col(aes(x = incident_year, y = maxCost))

costSummary <- birds %>% 
    filter(!is.na(cost_repairs_infl_adj)) %>% 
    group_by(incident_year) %>% 
    summarise(maxCost = max(cost_repairs_infl_adj))
    
ggplot(costSummary) +
    geom_col(aes(x = incident_year, y = maxCost))

# Extra practice 1 --------------------------------------------

# Use the mtcars data frame to create the following plots

ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point() +
    theme_bw() +
    labs(
        x = "Weight",
        y = 'Fuel Economy (mpg)'
    )

ggplot(mtcars, aes(x = hp, y = mpg)) +
    geom_point(aes(color=as.factor(cyl))) +
    theme_bw() +
    labs(
        x = "Horsepower (hp)",
        y = 'Fuel Economy (mpg)',
        color = 'Num. Cylinders'
    )

mtcars %>%
  group_by(cyl) %>%
  summarise(meanMpg = mean(mpg)) %>%
  ggplot() +
  geom_col(aes(x = cyl, y = meanMpg)) +
  labs(
      x = "Num. Cylinders",
      y = 'Mean Fuel Economy (mpg)'
  )

# Extra practice 2 --------------------------------------------

# Use the mpg data frame to create the following plot

mpg %>%
    mutate(manufacturer = str_to_title(manufacturer)) %>%
    group_by(manufacturer) %>%
    summarise(meanHwy = mean(hwy)) %>%
    arrange(desc(meanHwy)) %>% 
    ggplot() +
    geom_col(
      aes(
        x = meanHwy, 
        y = reorder(manufacturer, meanHwy)
      )
    ) +
    labs(
        x = 'Mean highway fuel economy (mpg)',
        y = 'Vehicle manufacturer'
    )
