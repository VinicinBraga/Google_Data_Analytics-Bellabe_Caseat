library(ggplot2)
library(dplyr)

# Carregar os data da planilha
data <- read.csv("sleepDay_merged.csv")

# Agrupar os data por dia da semana e calcular a média dos passos
media_sono_por_dia <- data %>%
  group_by(SleepDayOfWeek) %>%
  summarize(media_sono_diária = mean(TotalMinutesAsleep))

# Definir a ordem dos dias da semana
ordem_dias_semana <- c("domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado")

# Criar o gráfico de barras
grafico <- ggplot(data = media_sono_por_dia, aes(x = factor(SleepDayOfWeek, levels = ordem_dias_semana), y = media_sono_diária)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Dia da Semana", y = "Média de Sono Diária", title = "Média de Sono por Dias da Semana (Minutos)") +
  scale_y_continuous(breaks = seq(0, 1000, by = 50))

# Exibir o gráfico
print(grafico)


