library(ggplot2)
library(dplyr)

# Carregar os data da planilha
data <- read.csv("BellaBeat - CleanData.csv")

# Converter as colunas para tipo numérico
data$SedentaryMinutesByNumber <- as.numeric(data$SedentaryMinutesByNumber)

# Agrupar os data por dia da semana e calcular as médias
media_sedentary <- data %>%
  group_by(Day) %>%
  summarize(media_sedentary = mean(SedentaryMinutesByNumber, na.rm = TRUE))

# Definir a ordem dos dias da semana
ordem_dias_semana <- c("domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado")

# Criar os gráficos de barras
grafico_sedentary <- ggplot(data = media_sedentary, aes(x = factor(Day, levels = ordem_dias_semana), y = media_sedentary)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Dia da Semana", y = "Média de Minutos Sedentários (Semanais)", title = "Média Diária de Minutos Sedentários") +
  scale_y_continuous(breaks = seq(0, 400, by = 10), limits = c(0, 400))

# Exibir os gráficos
print(grafico_sedentary)
