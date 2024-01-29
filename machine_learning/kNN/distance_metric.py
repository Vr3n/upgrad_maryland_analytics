"""
The distance Matching for kNN algorithm.

- The Matching coefficient calculates the
  matching 0 to 0 and 1 to 1 in the dataset
  in comparison to the whole dataset.

- The matching distance which records the complimentary
  of the matching coefficient where the mismatch of the 
  0 to 0 and 1 to 1 are counted in comparison to whole dataset.
  The matching distance is calculated by `Matching coefficient - 1`.
"""
import pandas as pd
import numpy as np


## Assume our data consists of categorical variables
## 	- gender (male or gemale)
##	- marital status (Married or unmarried)
##  - financial status (high or low income)
##  - senior citizen or not (yes or no)

## We have 2 customers and we want to use the matching distance
## to calculate the distance between them:
customer_a = np.array([1, 0, 1, 1])
customer_b = np.array([0, 0, 1, 0])

matching_coefficient = np.sum(customer_a == customer_b) / len(customer_a)

matching_distance = 1 - matching_coefficient 

print("Matching coefficient", matching_coefficient)
print("Matching distance", matching_distance)




