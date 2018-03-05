fluidPage(
  
  # App title ----
  titlePanel("Make nice plots dammit"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      checkboxInput("colorBackground", "Colored Background", value = TRUE),
      checkboxInput("panelOutline", "Panel Outline", value = TRUE),
      checkboxInput("minorGridlines", "Minor Gridlines", value = TRUE),
      checkboxInput("majorGridlines", "Major Gridlines", value = TRUE),
      checkboxInput("axisTicks", "Axis Ticks", value = TRUE),
      checkboxInput("rangeframe", "Rangeframe"),
      checkboxInput("nicerColors", "Nicer Colors"),
      checkboxInput("legendInPlot", "Legend Inside Plot"),
      
      conditionalPanel(
        condition = "input.legendInPlot == true",
        sliderInput("legendX", "Legend X Coordinate", min=0, max=1, value=0.8, step=0.05),
        sliderInput("legendY", "Legend Y Coordinate", min=0, max=1, value=0.6, step=0.05)
      )
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "scatterplot")
      
    )
  )
)

