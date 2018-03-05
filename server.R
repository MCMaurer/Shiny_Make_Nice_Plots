library(tidyverse)
library(ggthemes)
library(ggExtra)
library(viridis)

function(input, output) {
  
  plot <- reactive(ggplot(mtcars, aes(x=wt,y=mpg))+
    geom_point(aes(color=cyl))+
    theme(text=element_text(family="Roboto Condensed", colour="black"))+
    xlab("Car weight (lb/1000)")+ 
    ylab("Miles per gallon of fuel")+
    {
      if (!input$colorBackground) theme(panel.background = element_blank())
    } +
    {
      if (input$minorGridlines) theme(panel.grid.minor = element_line(colour = "black"))
      else theme(panel.grid.minor = element_blank())
    } +
    {
      if (input$majorGridlines) theme(panel.grid.major = element_line(colour = "black")) 
      else theme(panel.grid.major = element_blank())
    } +
    {
      if (input$panelOutline) theme(panel.border = element_rect(fill=NA, colour = "black"))
      else theme(panel.border = element_blank())
    } +
    {
      if (!input$axisTicks) theme(axis.ticks = element_blank())
    } +
    {
      if (input$rangeframe) scale_x_continuous(breaks = round(as.vector(quantile(mtcars$wt)), digits = 1))
    } +
    {
      if (input$rangeframe) scale_y_continuous(breaks = round(as.vector(quantile(mtcars$mpg)), digits = 1))
    } +
    {
      if (input$nicerColors) scale_color_viridis()
    } +
    {
      if (input$legendInPlot) theme(legend.position = c(input$legendX, input$legendY), legend.title.align = 0.5)
    }
  )

  output$scatterplot <- renderPlot({
    plot()
  })
  
  # output$plotCode <- renderPrint(
  #   ggplot_build(plot())
  # )
  
  output$ggplotCode <- renderUI({
    str1 <- "ggplot(mtcars, aes(x=wt,y=mpg))+"
    str2 <- "geom_point(aes(color=cyl))+"
    str3 <- "xlab('Car weight (lb/1000)')+"
    str4 <- "ylab('Miles per gallon of fuel')+"
    str5 <- if (!input$colorBackground) "theme(panel.background = element_blank())+" else NULL
    str6 <- if (input$minorGridlines) "theme(panel.grid.minor = element_line(colour = 'black'))+"
    else "theme(panel.grid.minor = element_blank())+"
    str7 <- if (input$majorGridlines) "theme(panel.grid.major = element_line(colour = 'black'))+" 
    else "theme(panel.grid.major = element_blank())+"
    
    str8 <- if (input$panelOutline) "theme(panel.border = element_rect(fill=NA, colour = 'black'))+"
    else "theme(panel.border = element_blank())+"
    
    
    str9 <- if (!input$axisTicks) "theme(axis.ticks = element_blank())+" else NULL
    str10 <- if (input$rangeframe) "scale_x_continuous(breaks = round(as.vector(quantile(mtcars$wt)), digits = 1))+" else NULL
    str11 <- if (input$rangeframe) "scale_y_continuous(breaks = round(as.vector(quantile(mtcars$mpg)), digits = 1))+" else NULL
    str12 <- if (input$nicerColors) "scale_color_viridis()+" else NULL
    str13 <- if (input$legendInPlot) paste("theme(legend.position = c(",input$legendX,",",input$legendY,"), legend.title.align = 0.5)", sep = "")
    
    HTML(paste(str1, str2, str3, str4, str5, str6, str7, str8, str9, str10, str11, str12, str13, sep = '<br/>'))

  })
}
