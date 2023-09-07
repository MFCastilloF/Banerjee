clear all 
set more off
pause on
set trace off

* Cargar los datos de los hogares
use "C:\\Users\\maria\\Desktop\\Proyecto\\Data.dta", clear

* For fixed-effects model
local ses "robust" //Define robust standard errors
local fe_geo "vil_ham" //Fixed-effect

summarize treatment asset_ind_tot_el1 index_ctotal_el1 index_foodsecurity_el1 ind_increv_updated_el1 ind_fin_el1


* q-values were directly imputated
matrix qval_el1=[0.041, 0.001, 0.001, 0.041, 0.262, 0.028, 0.001, 0.001, 0.248]

********Regression model********************************************************

* Regression for asset_ind_tot
reg asset_ind_tot_el1 treatment if el1==1
* Regression for index_ctotal
reg index_ctotal_el1 treatment if el1==1
* Regression for index_foodsecurity
reg index_foodsecurity_el1 treatment if el1==1
* Regression for ind_increv_updated
reg ind_increv_updated_el1 treatment if el1==1
* Regression for ind_fin
reg ind_fin_el1 treatment if el1==1

*********Fixed-effects regression model*****************************************

* Regression for asset_ind_tot
eststo panel_el1_1: areg asset_ind_tot_el1 treatment if el1==1, absorb(`fe_geo') `ses'
estadd scalar qval = qval_el1[1,1]

* Regression for index_ctotal
eststo panel_el1_2: areg index_ctotal_el1 treatment if el1==1, absorb(`fe_geo') `ses'
estadd scalar qval = qval_el1[1,2]

* Regression for index_foodsecurity
eststo panel_el1_3: areg index_foodsecurity_el1 treatment if el1==1, absorb(`fe_geo') `ses'
estadd scalar qval = qval_el1[1,3]

* Regression for ind_increv_updated
eststo panel_el1_4: areg ind_increv_updated_el1 treatment if el1==1, absorb(`fe_geo') `ses'
estadd scalar qval = qval_el1[1,4]

* Regression for ind_fin
eststo panel_el1_5: areg ind_fin_el1 treatment if el1==1, absorb(`fe_geo') `ses'
estadd scalar qval = qval_el1[1,5]


esttab panel_el1_1 panel_el1_2 panel_el1_3 panel_el1_4 panel_el1_5 ///
      using "C:\\Users\\maria\\Desktop\\RA Microeconometría\\RCT\\Replicar\\Banerjee\\tab_Table1_g.tex", ///
      keep(treatment) ///
      b(3) ///
      se ///
      nonotes ///
      nomtitles ///
      nolines ///
      fragment ///
      wrap ///
      replace ///
      label ///
      style(tex)  ///
      stats(qval cmean bmean N, labels("q-value" "Control Mean" "Baseline Mean" "Observations"))

	  
