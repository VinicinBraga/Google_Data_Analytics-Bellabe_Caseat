library(ggplot2)
library(dplyr)

# Carregar os dados da planilha
dados <- read.csv("BellaBeat - CleanData.csv")

# Substituir vírgulas por pontos na coluna SedentaryActiveDistance
dados$VeryActiveDistance <- gsub(",", ".", dados$VeryActiveDistance)
dados$ModeratelyActiveDistance <- gsub(",", ".", dados$ModeratelyActiveDistance)
dados$LightActiveDistance <- gsub(",", ".", dados$LightActiveDistance)
dados$SedentaryActiveDistance <- gsub(",", ".", dados$SedentaryActiveDistance)

# Converter a coluna SedentaryActiveDistance em tipo numérico
dados$VeryActiveDistance <- as.numeric(dados$VeryActiveDistance)
dados$ModeratelyActiveDistance <- as.numeric(dados$ModeratelyActiveDistance)
dados$LightActiveDistance <- as.numeric(dados$LightActiveDistance)
dados$SedentaryActiveDistance <- as.numeric(dados$SedentaryActiveDistance)

# Agrupar os dados por dia da semana e calcular a média da distância em atividades sedentárias
media_distancia_atividade_very <- dados %>%
  group_by(Day) %>%
  summarize(media_distancia_very = mean(VeryActiveDistance, na.rm = TRUE))

media_distancia_atividade_moderate <- dados %>%
  group_by(Day) %>%
  summarize(media_distancia_moderate = mean(ModeratelyActiveDistance, na.rm = TRUE))

media_distancia_atividade_light <- dados %>%
  group_by(Day) %>%
  summarize(media_distancia_light = mean(LightActiveDistance, na.rm = TRUE))

media_distancia_atividade_sedentaria <- dados %>%
  group_by(Day) %>%
  summarize(media_distancia_sedentaria = mean(SedentaryActiveDistance, na.rm = TRUE))

# Definir a ordem dos dias da semana
ordem_dias_semana <- c("domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado")

# Criar o gráfico de barras para a distância em atividades sedentárias
grafico_very <- ggplot(data = media_distancia_atividade_very, aes(x = factor(Day, levels = ordem_dias_semana), y = media_distancia_very)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Dia da Semana", y = "Média da Distância em Atividades de Alto Impacto (Semanais)", title = "Média de Distância(Km) em Atividades de Alto Impacto por Dias da Semana") +
  scale_y_continuous(breaks = seq(0, 5, by = 1), limits = c(0, 5))

grafico_moderate <- ggplot(data = media_distancia_atividade_moderate, aes(x = factor(Day, levels = ordem_dias_semana), y = media_distancia_moderate)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Dia da Semana", y = "Média da Distância em Atividades Moderadas (Semanais)", title = "Média de Distância(Km) em Atividades Moderada por Dias da Semana") +
  scale_y_continuous(breaks = seq(0, 5, by = 1), limits = c(0, 5))

grafico_light <- ggplot(data = media_distancia_atividade_light, aes(x = factor(Day, levels = ordem_dias_semana), y = media_distancia_light)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Dia da Semana", y = "Média da Distância em Atividades Leves (Semanais)", title = "Média de Distância(Km) em Atividades Leves por Dias da Semana") +
  scale_y_continuous(breaks = seq(0, 5, by = 1), limits = c(0, 5))

grafico_sedentaria <- ggplot(data = media_distancia_atividade_sedentaria, aes(x = factor(Day, levels = ordem_dias_semana), y = media_distancia_sedentaria)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Dia da Semana", y = "Média da Distância em Atividades Sedentárias (Semanais)", title = "Média de Distância(Km) em Atividades Sedentárias por Dia da Semana") +
  scale_y_continuous(breaks = seq(0, 5, by = 1), limits = c(0, 5))

# Exibir o gráfico da distância em atividades sedentárias
print(grafico_sedentaria)
print(grafico_light)
print(grafico_moderate)
print(grafico_very)
