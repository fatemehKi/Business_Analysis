# -*- coding: utf-8 -*-
"""
Created on Tue Aug  6 03:44:50 2019

@author: fkiai
"""
#download plotly()


import matplotlib.pyplot as plt
#import numpy as np
 
# create data
x = [24.5, 20.4, 15.3, 13.5, 10.9, 6.4, 4.4, 2.0, 1.3, 1.0]
y = [-0.4, 24.5, 12.9, -2.3, 10.6, 6.0, 12.9, -3.9, -7.2, -15.5]

s=[ 196.302704, 163.098320, 122.760528, 107.910680, 87.497544, 51.238136, 35.232408, 16.373373, 10.049535, 8.061236]
 
# use the scatter function
plt.scatter(x, y, s=s, alpha=0.5)
plt.show()
