"""
Jaccard's coefficient only matches 
one to one data points compared to 
 dataset - number of matches.
"""
import numpy as np


customer_a = np.array([1, 0, 1, 1])
customer_b = np.array([0, 0, 1, 0])

matching_ones = np.sum((customer_a == 1) & (customer_b == 1))

jaccard_coeff =  matching_ones / np.sum(customer_a == 1) 
jaccard_distance = 1- jaccard_coeff
print("jaccard_coeff", jaccard_coeff)
print("jaccard_distance", jaccard_distance)
