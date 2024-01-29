import pandas as pd
import numpy as np
from scipy.spatial.distance import pdist, squareform
import matplotlib.pyplot as plt

# Data for the institutions
data = {
    'Institution': ['A', 'B', 'C', 'D', 'E'],
    'Enroll': [721, 512, 336, 137, 55],
    'Grad.Rate': [60, 56, 54, 59, 15]
}

# Creating a pandas DataFrame
df = pd.DataFrame(data)

k = 3


grad_rate = np.array([59, 54, 56])

print(grad_rate.mean())
