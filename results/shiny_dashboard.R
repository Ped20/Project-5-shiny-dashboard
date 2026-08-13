---
  title: "Project 5"
output: pdf_document
---
  
  ```{r eval=FALSE}
  
  
# PROJECT 5: Interactive R Shiny Web Application
# Goal: Allow dynamic filtering and plotting of plant traits.

# packages

library(shiny)
library(readxl)
library(ggplot2)

# 1. Read data - CHANGE THIS PATH if needed
d<- read_excel("C:/Users/prath/OneDrive/Desktop/proj1.xlsx", 
                  col_types = c("text", "numeric", "numeric", 
                                "numeric", "numeric", "text"))


# 2. USER INTERFACE (frontend process)
ui <- fluidPage(
  
  titlePanel("Plant Trait Explorer"),
  
  # selectInput takes input from the user
  selectInput( "trait", "Choose a trait:", # "trait" stored behind the dropbox and named "Choose a trait:" upon it 
              choices = c("Height" = "L",
                          "Breadth" = "B",
                          "Shoot Length" = "SL",
                          "Root Length" = "RL")),
  # plotOutput gives output to the user               
  plotOutput("myplot")
)

# 3. SERVER (Backend process)
server <- function(input, output) 
  {
  output$myplot <- renderPlot({
    
    ggplot(d, aes(x = LC, y = .data[[input$trait]], fill = LC)) +
      geom_boxplot() +
      labs(title = paste("Boxplot of", input$trait, "by Leaf Colour"),
           x = "Leaf Colour",y = input$trait) +
      theme_classic()
  })
}

# 4. Launch the app
shinyApp(ui = ui, server = server) #ui object from frontend and server object of backend

```r
rmarkdown::render("project5.Rmd")

