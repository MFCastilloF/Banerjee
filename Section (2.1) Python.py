# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
import pandas as pd
import statsmodels.api as sm

# Load the household data
data = pd.read_stata("C:\\Users\\maria\\Desktop\\Proyecto\\Data.dta")

# Remove rows with missing values
subset_data = subset_data.dropna(subset=['ind_fin_el1', 'treatment'])

# Check for missing values
print("Missing values in 'ind_fin_el1':", subset_data['ind_fin_el1'].isna().sum())
print("Missing values in 'treatment':", subset_data['treatment'].isna().sum())

# Re-run the regression
X = subset_data['treatment']
y = subset_data['ind_fin_el1']
X = sm.add_constant(X)
model = sm.OLS(y, X).fit()
print(model.summary())  # Note down the coefficient for the treatment variable

# Calculate the means and difference in means
mean_treatment = subset_data.loc[(subset_data['treatment'] == 1), 'ind_fin_el1'].mean()
mean_control = subset_data.loc[(subset_data['treatment'] == 0), 'ind_fin_el1'].mean()
diff_means = mean_treatment - mean_control
print(f"Difference in means (Treatment - Control): {diff_means}")

# Display the comparison
print("The coefficient from the regression should be equal to the difference in means to demonstrate equivalence.")
