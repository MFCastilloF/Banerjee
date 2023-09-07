# -*- coding: utf-8 -*-
"""
Created on Wed Sep  6 19:42:36 2023

@author: maria
"""

import pandas as pd
from linearmodels import PanelOLS
import pytablewriter

# Load the data
data = pd.read_stata('C:/Users/maria/Desktop/Proyecto/Data.dta')

# Q-values
qval_el1 = [0.041, 0.001, 0.001, 0.041, 0.262, 0.028, 0.001, 0.001, 0.248]

# Run regressions and store results
models = {}

# For asset_ind_tot
models['panel_el1_1'] = PanelOLS.from_formula('asset_ind_tot_el1 ~ treatment + EntityEffects', data.query('el1 == 1'))

# For index_ctotal
models['panel_el1_2'] = PanelOLS.from_formula('index_ctotal_el1 ~ treatment + EntityEffects', data.query('el1 == 1'))

# For index_foodsecurity
models['panel_el1_3'] = PanelOLS.from_formula('index_foodsecurity_el1 ~ treatment + EntityEffects', data.query('el1 == 1'))

# For ind_increv_updated
models['panel_el1_4'] = PanelOLS.from_formula('ind_increv_updated_el1 ~ treatment + EntityEffects', data.query('el1 == 1'))

# For ind_fin
models['panel_el1_5'] = PanelOLS.from_formula('ind_fin_el1 ~ treatment + EntityEffects', data.query('el1 == 1'))
