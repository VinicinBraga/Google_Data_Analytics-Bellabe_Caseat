library(ggplot2)
library(dplyr)

# Carregar os data da planilha
data <- read.csv("BellaBeat - CleanData.csv")

# Converter as colunas para tipo numérico
data$FairlyActiveMinutesByNumber <- as.numeric(data$FairlyActiveMinutesByNumber)

# Agrupar os data por dia da semana e calcular as médias
media_fairly_active <- data %>%
  group_by(Day) %>%
  summarize(media_fairly_active = mean(FairlyActiveMinutesByNumber, na.rm = TRUE))

# Definir a ordem dos dias da semana
ordem_dias_semana <- c("domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado")

# Criar os gráficos de barras
grafico_fairly_active <- ggplot(data = media_fairly_active, aes(x = factor(Day, levels = ordem_dias_semana), y = media_fairly_active)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Dia da Semana", y = "Média de Minutos Ativos Moderados (Semanais)", title = "Média Diária de Minutos Ativos Moderados") +
  scale_y_continuous(breaks = seq(0, 400, by = 10), limits = c(0, 80))

# Exibir os gráficos
print(grafico_fairly_active)