library(ggplot2)
library(dplyr)

# Carregar os dados da planilha
dados <- read.csv("BellaBeat - CleanData.csv")

# Converter as colunas para tipo numérico
dados$VeryActiveMinutesByNumber <- as.numeric(dados$VeryActiveMinutesByNumber)
dados$FairlyActiveMinutesByNumber <- as.numeric(dados$FairlyActiveMinutesByNumber)
dados$LightlyActiveMinutesByNumber <- as.numeric(dados$LightlyActiveMinutesByNumber)
dados$SedentaryMinutesByNumber <- as.numeric(dados$SedentaryMinutesByNumber)

# Agrupar os dados por dia da semana e calcular as médias
media_very_active <- dados %>%
  group_by(Day) %>%
  summarize(media_very_active = mean(VeryActiveMinutesByNumber, na.rm = TRUE))

media_fairly_active <- dados %>%
  group_by(Day) %>%
  summarize(media_fairly_active = mean(FairlyActiveMinutesByNumber, na.rm = TRUE))

media_lightly_active <- dados %>%
  group_by(Day) %>%
  summarize(media_lightly_active = mean(LightlyActiveMinutesByNumber, na.rm = TRUE))

media_sedentary <- dados %>%
  group_by(Day) %>%
  summarize(media_sedentary = mean(SedentaryMinutesByNumber, na.rm = TRUE))

# Definir a ordem dos dias da semana
ordem_dias_semana <- c("domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado")

# Criar os gráficos de barras
grafico_very_active <- ggplot(data = media_very_active, aes(x = factor(Day, levels = ordem_dias_semana), y = media_very_active)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Dia da Semana", y = "Média de Minutos Ativos em Alto Impacto (Semanais)", title = "Média Diária de Minutos Ativos em Alto Impacto") +
  scale_y_continuous(breaks = seq(0, 400, by = 10), limits = c(0, 50))

grafico_fairly_active <- ggplot(data = media_fairly_active, aes(x = factor(Day, levels = ordem_dias_semana), y = media_fairly_active)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Dia da Semana", y = "Média de Minutos Ativos Moderados (Semanais)", title = "Média Diária de Minutos Ativos Moderados") +
  scale_y_continuous(breaks = seq(0, 400, by = 10), limits = c(0, 80))

grafico_lightly_active <- ggplot(data = media_lightly_active, aes(x = factor(Day, levels = ordem_dias_semana), y = media_lightly_active)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Dia da Semana", y = "Média de Minutos Ativos Leves (Semanais)", title = "Média Diária de Minutos Ativos Leves") +
  scale_y_continuous(breaks = seq(0, 400, by = 10), limits = c(0, 400))

grafico_sedentary <- ggplot(data = media_sedentary, aes(x = factor(Day, levels = ordem_dias_semana), y = media_sedentary)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Dia da Semana", y = "Média de Minutos Sedentários (Semanais)", title = "Média Diária de Minutos Sedentários") +
  scale_y_continuous(breaks = seq(0, 400, by = 10), limits = c(0, 400))

# Exibir os gráficos
print(grafico_very_active)
print(grafico_fairly_active)
print(grafico_lightly_active)
print(grafico_sedentary)
