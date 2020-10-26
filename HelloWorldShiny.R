#What is shiny? ----
#Shiny is an open-source R package that provides visual outputs with interactive web boxes.
#Shiny integrates the power of R with the ease of visualization of web pages 

#Install Shiny ----
#install.packages("shiny") 

if (!require("shiny")){install.packages("shiny");   library("shiny")}

#Examples ----
#runExample(example = "01_hello")
#runExample(example = "02_text")
#runExample("03_reactivity")

# ShinyThemes ----
# Shinythemes provides visual improvements to the generation of our web dashboards https://github.com/rstudio/shinythemes 
# The themes are maked in Bootstrap (Framework web to gives style to web pages) 
# Themes: cerulean, cosmo, cyborg, darkly, flatly, journal, lumen, paper, readable, sandstone, simplex, slate, spacelab, superhero, united,  yeti
if (!require("shinythemes")){install.packages("shinythemes");   library("shinythemes")}

#ShinyApp ---- 
#This block contains all components for our web page 

# UI Block ----
# In this block we define the visual components and structure of our web page 
# Titles, Menus, Columns, Rows, box etc. Texts
ui <- fluidPage(
    theme = shinytheme("cerulean"),
    # Application title
    titlePanel("Hello World"),
    sidebarLayout(
      sidebarPanel(
        #  + Text UI----
        h6("TEXT EXAMPLE", style = "color:gray;"),
        #  + SliderInput ----
        sliderInput(inputId = "id_sliderInput", label =  "SliderInput:", min=0, max=1000, value=500),
        #  + Radio Buttons  ----
        radioButtons(inputId = "dist", label = "Select one:",
                     list("Normal" = "norm",
                          "Uniform" = "unif",
                          "Log-normal" = "lnorm",
                          "Exponential" = "exp")),
        #  + Numeric Inputs   ----
        numericInput(inputId = "obs", label = "Numeric input:", 10),
        #  + Button
        submitButton("My button")
      ),
      mainPanel( 
        #  + Table mytable----
        dataTableOutput('mytable')
      )
    )
    
    
)
#Server Block ---- 
server <- function(input, output) {
  # + Table mytable----
  output$mytable = renderDataTable({
    mtcars
  })
}
   
shinyApp(ui, server)



#dashboardPage Shiny----
#The dashboard is compose