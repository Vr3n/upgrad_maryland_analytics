import pandas as pd

# Data for the institutions
data = {
    'Institution': ['A', 'B', 'C', 'D', 'E'],
    'Ph.D.': [70, 29, 53, 92, 76],
    'Terminal': [78, 30, 66, 97, 72],
    'S.F.Ratio': [18.1, 12.2, 12.9, 7.7, 11.9],
    'perc.alumni': [12, 16, 30, 37, 2],
    'Grad.Rate': [60, 56, 54, 59, 15]
}

# Creating a pandas DataFrame
df = pd.DataFrame(data)

print(df['Grad.Rate'].mean())