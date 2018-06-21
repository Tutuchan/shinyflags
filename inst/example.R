library(htmltools)
library(shiny)
library(shinyflags)

flags <- flags_list()

ui <- fluidPage(
  tags$head(
    tags$style(
      HTML("
            .flag-icon {
    border: 2px solid black;
                      }")
    )
  ),
  headerPanel("New Application"),
  mainPanel(
    column(
      width = 3,
      selectInput(inputId = "flags", label = "Pick a country", choices = flags, multiple = FALSE),
      sliderInput(inputId = "size", label = "Size", min = 0, max = 300, value = 50),
      checkboxInput(inputId = "squared", label = "Is squared ?", value = FALSE),
      sliderInput(inputId = "width", label = "Width (px)", min = 0, max = 800, value = 50)
    ),
    column(
      width = 9,
      uiOutput("flag")
    )
  )
)

server <-  function(input, output, session) {
  output$flag <- renderUI({
    flag(country = input$flags, size = input$size, squared = input$squared, width = paste0(input$width, "px"))
  })
}

shinyApp(ui = ui, server = server)
