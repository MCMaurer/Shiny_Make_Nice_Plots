library(tidyverse)
library(ggthemes)
library(ggExtra)
library(viridis)

function(input, output) {

  output$scatterplot <- renderPlot({
    
    ggplot(mtcars, aes(x=wt,y=mpg))+
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
  })
}
