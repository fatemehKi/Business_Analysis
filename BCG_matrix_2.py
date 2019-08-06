# -*- coding: utf-8 -*-
"""
Created on Tue Aug  6 03:44:50 2019
@author: fkiai
"""

import matplotlib.pyplot as plt
import pandas as pd
 
# create data frame
x = [24.5, 20.4, 15.3, 13.5, 10.9, 6.4, 4.4, 2.0, 1.3, 1.0]
y = [-0.4, 24.5, 12.9, -2.3, 10.6, 6.0, 12.9, -3.9, -7.2, -15.5]
s=[ 19630.2704, 16309.8320, 12276.0528, 10791.0680, 8749.7544, 5123.8136, 3523.2408, 1637.3373, 1004.9535, 806.1236]
n=[ "Mayonnaise", "Tomato Sauce", "Chutney", "Hot Sauce", "Salad Dressing", "Pasta Sauce", "Marinade", "Gravy", "Mustard", "Salad Cream"]
 
df = pd.DataFrame({'x':x, 'y':y, 's':s, 'n':n })

 
fig, ax = plt.subplots(facecolor='w')

for key, row in df.iterrows():
    ax.scatter(row['x'], row['y'], s=row['s'], alpha=.5)
    ax.annotate(row['n'], xy=(row['x'], row['y']))  

