# Instale os pacotes necessários
install.packages("shiny")
install.packages("shinydashboard")

# Carregue as bibliotecas necessárias
library(shiny)
library(shinydashboard)

# Defina o UI do dashboard
ui <- dashboardPage(
  dashboardHeader(title = "Dashboard dos Gráficos"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(
        title = "Very Active Minutes",
        status = "primary",
        solidHeader = TRUE,
        width = 6,
        plotOutput("plot1")
      ),
      box(
        title = "Very Active Distance",
        status = "primary",
        solidHeader = TRUE,
        width = 6,
        plotOutput("plot2")
      ),
      box(
        title = "Trend of Activity Variables",
        status = "primary",
        solidHeader = TRUE,
        width = 6,
        plotOutput("plot3")
      ),
      box(
        title = "Sedentary Minutes",
        status = "primary",
        solidHeader = TRUE,
        width = 6,
        plotOutput("plot4")
      ),
      box(
        title = "Sedentary Active Distance",
        status = "primary",
        solidHeader = TRUE,
        width = 6,
        plotOutput("plot5")
      ),
      box(
        title = "Moderately Active Distance",
        status = "primary",
        solidHeader = TRUE,
        width = 6,
        plotOutput("plot6")
      ),
      box(
        title = "Moderate Active Minutes",
        status = "primary",
        solidHeader = TRUE,
        width = 6,
        plotOutput("plot7")
      ),
      box(
        title = "Lightly Active Minutes",
        status = "primary",
        solidHeader = TRUE,
        width = 6,
        plotOutput("plot8")
      ),
      box(
        title = "Light Active Distance",
        status = "primary",
        solidHeader = TRUE,
        width = 6,
        plotOutput("plot9")
      ),
      box(
        title = "Distribution of Activities",
        status = "primary",
        solidHeader = TRUE,
        width = 6,
        plotOutput("plot10")
      ),
      box(
        title = "Average Steps Weekly",
        status = "primary",
        solidHeader = TRUE,
        width = 6,
        plotOutput("plot11")
      ),
      box(
        title = "Average Daily Sleep",
        status = "primary",
        solidHeader = TRUE,
        width = 6,
        plotOutput("plot12")
      )
    )
  )
)

# Defina o servidor
server <- function(input, output) {
  # Função para carregar o gráfico de Very Active Minutes
  output$plot1 <- renderPlot({
    source("VeryActiveMinutes.R")
  })
  
  # Função para carregar o gráfico de Very Active Distance
  output$plot2 <- renderPlot({
    source("VeryActiveActiveDistance.R")
  })
  
  # Função para carregar o gráfico de Trend of Activity Variables
  output$plot3 <- renderPlot({
    source("TrendOActivityVariables.R")
  })
  
  # Função para carregar o gráfico de Sedentary Minutes
  output$plot4 <- renderPlot({
    source("SedentaryMinutes.R")
  })
  
  # Função para carregar o gráfico de Sedentary Active Distance
  output$plot5 <- renderPlot({
    source("SedentaryActiveDistance.R")
  })
  
  # Função para carregar o gráfico de Moderately Active Distance
  output$plot6 <- renderPlot({
    source("ModeratelyActiveDistance.R")
  })
  
  # Função para carregar o gráfico de Moderate Active Minutes
  output$plot7 <- renderPlot({
    source("ModerateActiveMinutes.R")
  })
  
  # Função para carregar o gráfico de Lightly Active Minutes
  output$plot8 <- renderPlot({
    source("LightlyActiveMinutes.R")
  })
  
  # Função para carregar o gráfico de Light Active Distance
  output$plot9 <- renderPlot({
    source("LightActiveDistance.R")
  })
  
  # Função para carregar o gráfico de Distribution of Activities
  output$plot10 <- renderPlot({
    source("Distribution OfActivities.R")
  })
  
  # Função para carregar o gráfico de Average Steps Weekly
  output$plot11 <- renderPlot({
    source("AverageStepsWeekly.R")
  })
  
  # Função para carregar o gráfico de Average Daily Sleep
  output$plot12 <- renderPlot({
    source("AverageDailySleep.R")
  })
}

# Execute o aplicativo Shiny
shinyApp(ui, server)
