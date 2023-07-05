# Carregue as bibliotecas necessárias
library(shiny)
library(shinydashboard)

# Defina o UI do dashboard
ui <- dashboardPage(
  dashboardHeader(title = "Dashboard dos Gráficos"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Very Active Minutes", tabName = "plot1"),
      menuItem("Very Active Distance", tabName = "plot2"),
      menuItem("Trend of Activity Variables", tabName = "plot3"),
      menuItem("Sedentary Active Minutes", tabName = "plot4"),
      menuItem("Sedentary Active Distance", tabName = "plot5"),
      menuItem("Moderately Active Distance", tabName = "plot6"),
      menuItem("Moderate Active Minutes", tabName = "plot7"),
      menuItem("Lightly Active Minutes", tabName = "plot8"),
      menuItem("Light Active Distance", tabName = "plot9"),
      menuItem("Distribution of Activities", tabName = "plot10"),
      menuItem("Average Steps Weekly", tabName = "plot11"),
      menuItem("Average Daily Sleep", tabName = "plot12"),
      menuItem("Todos os Gráficos", tabName = "plot_all")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "plot1",
              fluidRow(
                box(
                  title = "Very Active Minutes",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12,
                  plotOutput("plot1")
                )
              )
      ),
      tabItem(tabName = "plot2",
              fluidRow(
                box(
                  title = "Very Active Distance",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12,
                  plotOutput("plot2")
                )
              )
      ),
      tabItem(tabName = "plot3",
              fluidRow(
                box(
                  title = "Trend of Activity Variables",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12,
                  plotOutput("plot3")
                )
              )
      ),
      tabItem(tabName = "plot4",
              fluidRow(
                box(
                  title = "Sedentary Active Minutes",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12,
                  plotOutput("plot4")
                )
              )
      ),
      tabItem(tabName = "plot5",
              fluidRow(
                box(
                  title = "Sedentary Active Distance",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12,
                  plotOutput("plot5")
                )
              )
      ),
      tabItem(tabName = "plot6",
              fluidRow(
                box(
                  title = "Moderately Active Distance",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12,
                  plotOutput("plot6")
                )
              )
      ),
      tabItem(tabName = "plot7",
              fluidRow(
                box(
                  title = "Moderate Active Minutes",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12,
                  plotOutput("plot7")
                )
              )
      ),
      tabItem(tabName = "plot8",
              fluidRow(
                box(
                  title = "Lightly Active Minutes",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12,
                  plotOutput("plot8")
                )
              )
      ),
      tabItem(tabName = "plot9",
              fluidRow(
                box(
                  title = "Light Active Distance",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12,
                  plotOutput("plot9")
                )
              )
      ),
      tabItem(tabName = "plot10",
              fluidRow(
                box(
                  title = "Distribution of Activities",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12,
                  plotOutput("plot10")
                )
              )
      ),
      tabItem(tabName = "plot11",
              fluidRow(
                box(
                  title = "Average Steps Weekly",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12,
                  plotOutput("plot11")
                )
              )
      ),
      tabItem(tabName = "plot12",
              fluidRow(
                box(
                  title = "Average Daily Sleep",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12,
                  plotOutput("plot12")
                )
              )
      ),
      tabItem(tabName = "plot_all",
              fluidRow(
                column(width = 12,
                       plotOutput("plot_all1"),
                       plotOutput("plot_all2"),
                       plotOutput("plot_all3"),
                       plotOutput("plot_all4"),
                       plotOutput("plot_all5"),
                       plotOutput("plot_all6"),
                       plotOutput("plot_all7"),
                       plotOutput("plot_all8"),
                       plotOutput("plot_all9"),
                       plotOutput("plot_all10"),
                       plotOutput("plot_all11"),
                       plotOutput("plot_all12")
                )
              )
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
    source("VeryActiveDistance.R")
  })
  
  # Função para carregar o gráfico de Trend of Activity Variables
  output$plot3 <- renderPlot({
    source("TrendOfActivityVariables.R")
  })
  
  # Função para carregar o gráfico de Sedentary Minutes
  output$plot4 <- renderPlot({
    source("SedentaryActiveMinutes.R")
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
    source("DistributionOfActivities.R")
  })
  
  # Função para carregar o gráfico de Average Steps Weekly
  output$plot11 <- renderPlot({
    source("AverageStepsWeekly.R")
  })
  
  # Função para carregar o gráfico de Average Daily Sleep
  output$plot12 <- renderPlot({
    source("AverageDailySleep.R")
  })
  
  # Função para carregar todos os gráficos
  output$plot_all1 <- renderPlot({
    source("VeryActiveMinutes.R")
  })
  output$plot_all2 <- renderPlot({
    source("VeryActiveDistance.R")
  })
  output$plot_all3 <- renderPlot({
    source("TrendOfActivityVariables.R")
  })
  output$plot_all4 <- renderPlot({
    source("SedentaryActiveMinutes.R")
  })
  output$plot_all5 <- renderPlot({
    source("SedentaryActiveDistance.R")
  })
  output$plot_all6 <- renderPlot({
    source("ModeratelyActiveDistance.R")
  })
  output$plot_all7 <- renderPlot({
    source("ModerateActiveMinutes.R")
  })
  output$plot_all8 <- renderPlot({
    source("LightlyActiveMinutes.R")
  })
  output$plot_all9 <- renderPlot({
    source("LightActiveDistance.R")
  })
  output$plot_all10 <- renderPlot({
    source("DistributionOfActivities.R")
  })
  output$plot_all11 <- renderPlot({
    source("AverageStepsWeekly.R")
  })
  output$plot_all12 <- renderPlot({
    source("AverageDailySleep.R")
  })
}

# Execute o aplicativo Shiny
shinyApp(ui, server)



