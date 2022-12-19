# Sent by Travis Greene on Sept. 17, 2020, based on his post:
# https://towardsdatascience.com/data-analysis-in-r-just-how-overcrowded-are-us-prisons-9b78317125bc

# This should reproduce the analysis on Medium
library(tidyverse)
library(stringr)

# The original files used ... and / to denote NAs
df <- read_csv('prison.csv', skip = 12)

#check out the data
head(df, 5)


    ##   Jurisdiction   Rated Operational Design Custody.population
    ## 1    Federal/b 134,461        <NA>   <NA>            160,946
    ## 2    Alabama/c    <NA>      25,763 13,318             24,814
    ## 3     Alaska/d    <NA>       5,352   <NA>              5,247
    ## 4      Arizona  37,238      43,747 37,238             35,733
    ## 5     Arkansas  16,194      16,233 15,382             15,784
    ##   Lowest.capacity.a X Highest.capacity.a X.1
    ## 1             119.7 %              119.7   %
    ## 2             186.3                 96.3
    ## 3              98.0                 98.0
    ## 4              96.0                 81.7
    ## 5             102.6                 97.2


# Remove extra columns
df <- df[1:51,-c(7,9)]

# Convert NAs to 0
df[is.na(df)] <- 0

# We are going to join our dataframe to this one later
state_pop <- read_csv('statepop1.csv')

# Correct backslashes in names of jurisdictions
bad <- df[which(str_detect(df$Jurisdiction, '[:punct:]')),]$Jurisdiction

# If have slash, then delete last three chars
df[which(str_detect(df$Jurisdiction, '[:punct:]')),]$Jurisdiction <- str_sub(bad, end = -3)

# This one manually do because had 3 chars after slash
df[which(df$Jurisdiction == 'Idaho/e'),]$Jurisdiction <- 'Idaho'

# Replace commas in numbers
df[,2:ncol(df)] <- lapply(df[,2:ncol(df)], function(x) as.numeric(gsub(",", "", as.character(x))))

# Make column names the same for joining
colnames(df)[1] <- 'state'

full_df <- left_join(df,state_pop, by = 'state')

# We'll use the total population of the USA for the federal population
full_df[1,'pop_est_2014'] <- 325000000

# Instead of high and low capacity percentages, we'll average both to get one statistic
avgcap <- full_df %>%
  group_by(state)%>%
  mutate(avg_cap = mean(c(Lowest.capacity.a, Highest.capacity.a)))

# Apply to new column
full_df$avg_cap <- avgcap$avg_cap
full_df <- full_df %>%
  mutate(pop_est_2014 = pop_est_2014*.76)

# Now compute the % of prison age population in prison
full_df <- full_df %>%
  mutate(pop_prison_perc = Custody.population/pop_est_2014*100)

# Verify with bar chart
full_df %>%
  group_by(state)%>%
  arrange(desc(pop_prison_perc))%>%
  head()%>%
  ggplot(aes(reorder(state, pop_prison_perc), pop_prison_perc, fill=state))+
  geom_col()+
  guides(fill= FALSE)+
  scale_y_continuous(breaks = seq(from=0, to=1, by=.1))+
  theme_minimal()+
  labs(title='States with highest % in state prisons', x='states')

write_csv(full_df, 'prisoncapacityMedium.csv')
