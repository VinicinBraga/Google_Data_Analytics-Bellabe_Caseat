# Carregar o pacote necessário
library(ggplot2)

# Carregar os dados do arquivo CSV
data <- read.csv("BellaBeat - CleanData.csv")

# Converter a coluna ActivityDate para o formato de data
data$ActivityDate <- as.Date(data$ActivityDate)

# Ordenar os dados pela coluna ActivityDate
data <- data[order(data$ActivityDate), ]

# Converter as variáveis para o tipo de dados "factor"
data$TotalSteps <- as.factor(data$TotalSteps)
data$TotalDistanceDot <- as.factor(data$TotalDistanceDot)
data$Calories <- as.factor(data$Calories)

# Definir uma paleta de cores em tons de azul
my_palette <- colorRampPalette(c("steelblue", "lightsteelblue"))(3)

# Criar o gráfico de área
ggplot(data, aes(x = ActivityDate)) +
  geom_area(aes(y = as.numeric(TotalSteps), fill = "Total de Passos"), alpha = 0.5) +
  geom_area(aes(y = as.numeric(TotalDistanceDot), fill = "Distance Total"), alpha = 0.5) +
  geom_area(aes(y = as.numeric(Calories), fill = "Calorias"), alpha = 0.5) +
  scale_fill_manual(values = my_palette) +
  labs(x = "Data", y = "Valor", fill = "Variáveis",  title = "Tendência das Variáveis de Atividades") +
  theme_minimal()
