# Shiny_Make_Nice_Plots
I'm working on a Shiny app to help visualize some of the properties of nice graphics. You start off with a ggplot plot that has a lot going on: gridlines, background color, just way too much ink. You can then remove elements and add some others, hopefully getting to a much nicer-looking plot.

## Parts in Progress

- I've added a hackish method of generating the ggplot code that could be used to make the standalone plot (the issues is that my actual ggplot code inside the server.R includes all these ugly reactive elements). I've gotta work on cleaning this up and hopefully making the code syntax look better.

- I think it would be awesome to include a calculated data-ink ratio somewhere in the app. I