library(ggplot2)
library(dplyr)

# Carregar os dados da planilha
dados <- read.csv("BellaBeat - CleanData.csv")

# Converter as colunas para tipo numérico
dados$VeryActiveMinutesByNumber <- as.numeric(dados$VeryActiveMinutesByNumber)

# Agrupar os dados por dia da semana e calcular as médias
media_very_active <- dados %>%
  group_by(Day) %>%
  summarize(media_very_active = mean(VeryActiveMinutesByNumber, na.rm = TRUE))

# Definir a ordem dos dias da semana
ordem_dias_semana <- c("domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado")

# Criar os gráficos de barras
grafico_very_active <- ggplot(data = media_very_active, aes(x = factor(Day, levels = ordem_dias_semana), y = media_very_active)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Dia da Semana", y = "Média de Minutos Ativos em Alto Impacto (Semanais)", title = "Média Diária de Minutos Ativos em Alto Impacto") +
  scale_y_continuous(breaks = seq(0, 400, by = 10), limits = c(0, 50))

# Exibir os gráficos
print(grafico_very_active)
