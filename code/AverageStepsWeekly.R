library(ggplot2)
library(dplyr)

# Carregar os data da planilha
data <- read.csv("BellaBeat - CleanData.csv")

# Agrupar os data por dia da semana e calcular a média dos passos
media_passos_por_dia <- data %>%
  group_by(Day) %>%
  summarize(media_passos = mean(TotalSteps))

# Definir a ordem dos dias da semana
ordem_dias_semana <- c("domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado")

# Criar o gráfico de barras
grafico <- ggplot(data = media_passos_por_dia, aes(x = factor(Day, levels = ordem_dias_semana), y = media_passos)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Dia da Semana", y = "Passos Médios", title = "Média de Passos por Dia da Semana") +
  scale_y_continuous(breaks = seq(0, 8000, by = 200))

# Exibir o gráfico
print(grafico)
