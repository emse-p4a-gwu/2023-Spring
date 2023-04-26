set.seed(5678)

options(
    dplyr.width = Inf,
    dplyr.print_min = 6,
    dplyr.print_max = 6,
    stringr.view_n = 10,
    pillar.bold = TRUE,
    width = 77 # 80 - 3 for #> comment
)

knitr::opts_chunk$set(
    message = FALSE,
    warning = FALSE,
    comment    = "#>",
    fig.retina = 3,
    fig.width  = 6,
    fig.height = 4,
    fig.show = "hold",
    fig.align  = "center",
    fig.path   = "figs/"
)

get_schedule <- function() {
    
    # Icons
    # https://icons.getbootstrap.com/
    # fa <- list(
    #     class      = '<i class="bi-laptop-fill"></i>',
    #     assignment = '<i class="bi-pencil-fill"></i>',
    #     reading    = '<i class="bi-book-fill"></i>'
    # )
    
    schedule_raw <- read_csv(here::here('schedule.csv'))
    
    # Quiz vars
    quiz <- schedule_raw %>%
        mutate(
            quiz = ifelse(
                is.na(quiz),
                "",
                paste0('Quiz ', quiz, ":<br><em>", quiz_coverage, "</em>"))
        ) %>%
        select(week, quiz)
    
    # Weekly assignment vars
    assignments <- schedule_raw %>%
        mutate(
            due_assign = format(due_assign, format = "%b %d"),
            assignments = ifelse(
                is.na(due_assign),
                "",
                paste0(
                    '<a href="hw/', n_assign, "-", stub_assign, '.html"><b>HW ',
                    n_assign, "</b></a><br>Due: ", due_assign))
        ) %>%
        select(week, assignments)
    
    # Class vars
    class <- schedule_raw %>%
        mutate(
            description_class = ifelse(
                is.na(description_class),
                "",
                description_class),
            class = ifelse(
                is.na(stub_class),
                paste0("<b>", name_class, "</b><br>", description_class),
                paste0(
                    '<a href="class/', n_class, "-", stub_class, '.html"><b>',
                    name_class, "</b></a><br> ",
                    description_class)),
        ) %>%
        select(week, class)
    
    # Reading vars
    reading <- schedule_raw %>%
        select(week, ends_with("_reading"), reading) %>%
        rename(name = name_reading, stub = stub_reading) %>%
        mutate(
            name = str_split(name, '\n'),
            stub = str_split(stub, '\n')
        )
    
    # Fix reading names
    reading_root <- 'https://p4a.jhelvy.com/'
    reading$readings <- ""
    for (i in 1:nrow(reading)) {
        name <- reading[i,]$name[[1]]
        if (any(is.na(unlist(name)))) {
            result <- ''
        } else {
            stub <- reading[i,]$stub[[1]]
            result <- paste0(
                '<a href=', reading_root, stub ,'.html target="_blank"><b>',
                name, "</b></a>")
            result <- paste(result, collapse = '<br>')
            
        }
        reading$readings[i] <- result
    }
    reading$name <- NULL
    reading$stub <- NULL
    reading <- reading %>% 
        mutate(readings = ifelse(!is.na(reading), reading, readings))
    
    # Final schedule data frame
    schedule <- schedule_raw %>%
        select(week, date, n_assign, due_assign) %>%
        mutate(date_md = format(date, format = "%b %d")) %>%
        left_join(quiz, by = "week") %>%
        left_join(class, by = "week") %>%
        left_join(assignments, by = "week") %>%
        left_join(reading, by = "week") %>% 
        ungroup()
    
    return(schedule)
}
