# Load the required packages
library(plm)
library(stargazer)
library(haven)

# Load the data
data <- read_dta('C:/Users/maria/Desktop/Proyecto/Data.dta')

# Define fixed effects and robust standard errors
fe_geo <- 'vil_ham'
ses <- 'HC3'

# Q-values
qval_el1 <- c(0.041, 0.001, 0.001, 0.041, 0.262, 0.028, 0.001, 0.001, 0.248)

# Run regressions and store results
models <- list()

# For asset_ind_tot
models[['panel_el1_1']] <- plm(asset_ind_tot_el1 ~ treatment, data = subset(data, el1 == 1), model = 'within', effect = 'individual', index = fe_geo)

# For index_ctotal
models[['panel_el1_2']] <- plm(index_ctotal_el1 ~ treatment, data = subset(data, el1 == 1), model = 'within', effect = 'individual', index = fe_geo)

# For index_foodsecurity
models[['panel_el1_3']] <- plm(index_foodsecurity_el1 ~ treatment, data = subset(data, el1 == 1), model = 'within', effect = 'individual', index = fe_geo)

# For ind_increv_updated
models[['panel_el1_4']] <- plm(ind_increv_updated_el1 ~ treatment, data = subset(data, el1 == 1), model = 'within', effect = 'individual', index = fe_geo)

# For ind_fin
models[['panel_el1_5']] <- plm(ind_fin_el1 ~ treatment, data = subset(data, el1 == 1), model = 'within', effect = 'individual', index = fe_geo)

# Generate LaTeX table
stargazer(models, type = 'latex', out = 'C:/Users/maria/Desktop/Proyecto/tab_Table1_g.tex', covariate.labels = c('Treatment'), omit.stat = c('ser', 'F'), add.lines = list(c('q-value', qval_el1)))

