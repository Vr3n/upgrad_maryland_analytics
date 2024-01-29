from numpy.typing import NDArray
import pandas as pd
import numpy as np

# Data for the transactions with updated values
data = {
    'TransactionID': ['A', 'B', 'C', 'D', 'E'],
    'category_food_dining': [1, 0, 0, 0, 0],
    'category_health_fitness': [0, 1, 1, 0, 0],
    'category_personal_care': [0, 0, 0, 1, 0],
    'category_others': [0, 0, 0, 0, 1],
    'gender': [0, 1, 1, 0, 1],  # Updated gender values
    'age<30': [1, 0, 1, 1, 0],  # Updated age<30 values
    '30<age<45': [0, 1, 0, 0, 1],  # Updated 30<age<45 values
    'is_fraud': [1, 1, 0, 0, 1]
}

# Creating a pandas DataFrame with updated values
df = pd.DataFrame(data).set_index("TransactionID")



# Question 1: WHat is the jaccard's distance between B and C.
b = np.array(df.loc["B"].tolist())
c = np.array(df.loc["C"].tolist())


# max_one = np.sum((b == 1) | (c ==  1))
# jaccard_coeff = np.sum((b == 1) & (c == 1)) / max_one
# jaccard_metric = 1 - jaccard_coeff


# print("The jaccard coefficient is: ", jaccard_coeff)
# print("The jaccard metric is: ", jaccard_metric)


# Question 2: Which transaction is the most similar to transaction E
# (use the matching distance as the distance metric.)
a = np.array(df.loc["A"].tolist())
d = np.array(df.loc["D"].tolist())
e = np.array(df.loc["E"].tolist())

for el in [a, b, c, d]:
    matching_coeff = np.sum((e == 1) & (el == 1)) / len(el)
    matching_distance = 1 - matching_coeff

    print("The matching coef: ", matching_coeff)
    print("The matching distance: ", matching_distance) 
