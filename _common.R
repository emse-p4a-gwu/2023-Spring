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
    fa <- list(
        class      = '<i class="fas fa-laptop-code"></i>',
        assignment = '<i class="fas fa-pencil-ruler"></i>',
        reading    = '<i class="fas fa-book"></i>'
    )

    schedule_raw <- read_csv(here::here('content', 'schedule.csv'))

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
        filter(!is.na(name_assign)) %>%
        mutate(
            due_assign = format(due_assign, format = "%b %d"),
            assignments = ifelse(
                is.na(due_assign),
                NA,
                paste0(
                    '<a href="hw/', n_assign, "-", stub_assign, '.html">',
                    fa$assignment, '</a><b> ', name_assign,
                    "</b><br>Due: ", due_assign))
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
                paste0("<b>", name_class, "</b>"),
                paste0(
                    '<a href="class/', n_class, "-", stub_class, '.html">',
                    fa$class, '</a><b> ', name_class, "</b><br> ",
                    description_class)),
        ) %>%
        select(week, class)

    # Reading vars
    reading <- schedule_raw %>%
        select(week, ends_with("_reading")) %>%
        filter(!is.na(name_reading)) %>%
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
        if ('' %in% name) {
            result <- ''
        } else {
            stub <- reading[i,]$stub[[1]]
            result <- paste0(
                '<a href=', reading_root, stub ,'.html target="_blank">',
                fa$reading, '</a> ', name)
            result <- paste(result, collapse = '<br>')

        }
        reading$readings[i] <- result
    }
    reading$name <- NULL
    reading$stub <- NULL

    # Final schedule data frame
    schedule <- schedule_raw %>%
        select(week, date, n_assign, due_assign) %>%
        mutate(date_md = format(date, format = "%b %d")) %>%
        left_join(quiz, by = "week") %>%
        left_join(class, by = "week") %>%
        left_join(assignments, by = "week") %>%
        left_join(reading, by = "week")

    return(schedule)
}
