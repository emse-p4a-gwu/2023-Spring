library(tidyverse)
library(janitor)

pop <- read_csv("statePop.csv") %>%
    clean_names() %>%
    select(state = name, pop = popestimate2019)
prisoners <- read_csv("p19at02.csv", skip = 10) %>%
    select(-`State/federal`) %>%
    clean_names() %>%
    rename(state = x2) %>%
    filter(!is.na(state)) %>%
    gather(key = type, value = val, -state) %>%
    mutate(
        state = str_replace(state, "/g", ""),
        state = str_replace(state, "/e", ""),
        state = str_replace(state, "/f", ""),
        state = str_replace(state, "/d", ""),
        state = str_replace(state, "/c", ""),
        type = str_replace(type, "_a$", ""),
        val = as.numeric(val),
        type = paste0("prison_pop_", type),
        type = fct_reorder(type, -val)) %>%
    spread(key = type, value = val) %>%
    left_join(pop, by = "state") %>%
    select(state, state_pop = pop, everything())

write_csv(prisoners, "prisoners2019.csv")
