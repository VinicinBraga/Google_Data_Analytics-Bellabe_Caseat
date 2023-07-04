library(ggplot2)
library(dplyr)

# Carregar os dados da planilha
dados <- read.csv("BellaBeat - CleanData.csv")

# Substituir vírgulas por pontos na coluna 
dados$VeryActiveDistance <- gsub(",", ".", dados$VeryActiveDistance)

# Converter a coluna em tipo numérico
dados$VeryActiveDistance <- as.numeric(dados$VeryActiveDistance)

# Agrupar os dados por dia da semana e calcular a média da distância em atividades
media_distancia_atividade_very <- dados %>%
  group_by(Day) %>%
  summarize(media_distancia_very = mean(VeryActiveDistance, na.rm = TRUE))

# Definir a ordem dos dias da semana
ordem_dias_semana <- c("domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado")

# Criar o gráfico de barras para a distância em atividades
grafico_very <- ggplot(data = media_distancia_atividade_very, aes(x = factor(Day, levels = ordem_dias_semana), y = media_distancia_very)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Dia da Semana", y = "Média da Distância em Atividades de Alto Impacto (Semanais)", title = "Média de Distância(Km) em Atividades de Alto Impacto por Dias da Semana") +
  scale_y_continuous(breaks = seq(0, 5, by = 1), limits = c(0, 5))

# Exibir o gráfico da distância em atividades

print(grafico_very)
