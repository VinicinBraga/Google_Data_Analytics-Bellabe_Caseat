library(ggplot2)
library(dplyr)
library(scales)

# Carregar os dados da planilha
data <- read.csv("BellaBeat - CleanData.csv")

# Calcular a soma dos minutos em cada categoria de atividade
total_very_active <- sum(data$VeryActiveMinutesByNumber)
total_fairly_active <- sum(data$FairlyActiveMinutesByNumber)
total_lightly_active <- sum(data$LightlyActiveMinutesByNumber)
total_sedentary <- sum(data$SedentaryMinutesByNumber)

# Criar um data frame com as informações
activity_data <- data.frame(
  Atividade = c("Muito Ativo", "Moderadamente Ativo", "Levemente Ativo", "Sedentário"),
  TotalMinutos = c(total_very_active, total_fairly_active, total_lightly_active, total_sedentary)
)

# Calcular a porcentagem de cada pedaço
activity_data$Porcentagem <- activity_data$TotalMinutos / sum(activity_data$TotalMinutos) * 100

# Plotar o gráfico de pizza com as informações completas
ggplot(activity_data, aes(x = "", y = Porcentagem, fill = Atividade)) +
  geom_col(width = 1) +
  coord_polar("y", start = 0) +
  geom_text(aes(label = percent(Porcentagem / 100)), position = position_stack(vjust = 0.5)) +
  labs(title = "Distribuição de Atividades") +
  scale_fill_manual(values = c("#4682B4", "#1F3552", "#2C507D", "#3A608E")) +
  theme_void()
