library(dplyr)
library(readxl)
library(plyr)
library(ggplot2)
library(xtable)
library(tidyr)
library(haven)

# Load the household data
data <- read_dta("C:\\Users\\maria\\Desktop\\Proyecto\\Data.dta")

# Simple Regression for ind_fin_el1
fit <- lm(ind_fin_el1 ~ treatment, data = subset(data, el1 == 1))
summary(fit)  # Note down the coefficient for the treatment variable

# Calculate mean for the treatment group
mean_treatment <- mean(subset(data, treatment == 1 & el1 == 1)$ind_fin_el1,na.rm = T)

# Calculate mean for the control group
mean_control <- mean(subset(data, treatment == 0 & el1 == 1)$ind_fin_el1, na.rm = T)

# Calculate and display the difference in means
diff_means <- mean_treatment - mean_control
print(paste("Difference in means (Treatment - Control): ", diff_means))

# Display the comparison
print("The coefficient from the regression should be equal to the difference in means to demonstrate equivalence.")
