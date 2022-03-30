#make this example reproducible
set.seed(1)

#create data frame
data <- data.frame(age = rep(1:100, 2), gender = rep(c("M", "F"), each = 100))

#add population variable
data$population <- 1/sqrt(data$age) * runif(200, 10000, 15000)

#convert population variable to percentage
data$population <- data$population / sum(data$population) * 100

#view first six rows of dataset
head(data)

#load ggplot2
library(ggplot2)

#create population pyramid
ggplot(data, aes(x = age, fill = gender,
                 y = ifelse(test = gender == "M",
                            yes = -population, no = population))) + 
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = abs, limits = max(data$population) * c(-1,1)) +
  coord_flip()

ggplot(data, aes(x = age, fill = gender,
                 y = ifelse(test = gender == "M",
                            yes = -population, no = population))) + 
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = abs, limits = max(data$population) * c(-1,1)) +
  labs(title = "Population Pyramid", x = "Age", y = "Percent of population") +
  coord_flip()

ggplot(data, aes(x = age, fill = gender,
                 y = ifelse(test = gender == "M",
                            yes = -population, no = population))) + 
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = abs, limits = max(data$population) * c(-1,1)) +
  labs(title = "Population Pyramid", x = "Age", y = "Percent of population") +
  scale_colour_manual(values = c("pink", "steelblue"),
                      aesthetics = c("colour", "fill")) +
  coord_flip()