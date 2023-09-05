* Load the household data
use "C:\\Users\\maria\\Desktop\\RA Microeconometría\\RCT\\Replicar\\Banerjee\\Data\\base_prueba.dta", clear

* Simple Regression for ind_fin_el1
reg ind_fin_el1 treatment if el1==1
* Note down the coefficient for the treatment variable

* Calculate mean for the treatment group
summarize ind_fin_el1 if treatment==1 & el1==1
scalar mean_treatment = r(mean)

* Calculate mean for the control group
summarize ind_fin_el1 if treatment==0 & el1==1
scalar mean_control = r(mean)

* Calculate and display the difference in means
scalar diff_means = mean_treatment - mean_control
display "Difference in means (Treatment - Control): " diff_means

* Display the comparison
di "The coefficient from the regression should be equal to the difference in means to demonstrate equivalence."
