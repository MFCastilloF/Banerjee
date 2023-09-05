clear all 
set more off
set maxvar 30000
pause on
set trace off

* Cargar los datos de los hogares
use "C:\\Users\\maria\\Desktop\\RA Microeconometría\\RCT\\Replicar\\Banerjee\\Data\\base_prueba.dta", clear

* Variables de hogares
local ses "robust"
local fe_geo "vil_ham"


* Los valores q fueron imputados directamente por los autores
matrix qval_el1=[0.041, 0.001, 0.001, 0.041, 0.262, 0.028, 0.001, 0.001, 0.248]

* Regresión para asset_ind_tot
eststo panel_el1_1: areg asset_ind_tot_el1 treatment if el1==1, absorb(`fe_geo') `ses'
estadd scalar qval = qval_el1[1,1]

* Regresión para index_ctotal
eststo panel_el1_2: areg index_ctotal_el1 treatment if el1==1, absorb(`fe_geo') `ses'
estadd scalar qval = qval_el1[1,2]

* Regresión para index_foodsecurity
eststo panel_el1_3: areg index_foodsecurity_el1 treatment if el1==1, absorb(`fe_geo') `ses'
estadd scalar qval = qval_el1[1,3]

* Regresión para ind_increv_updated
eststo panel_el1_4: areg ind_increv_updated_el1 treatment if el1==1, absorb(`fe_geo') `ses'
estadd scalar qval = qval_el1[1,4]

* Regresión para ind_fin
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

	  
