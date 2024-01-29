import pandas as pd
import numpy as np
import plotly.graph_objects as go

df = pd.read_csv("fraud_detection_small_dataset.csv")

fig = go.Figure()

fig.add_trace(
go.Scatter(
	x=df["amt"],
	y=[0] * df['amt'].size,
	mode="markers",
	marker=dict(size=20,
				color=((df['is_fraud'] == 1).astype('int')),
	)
))
fig.update_xaxes(showgrid=False)
fig.update_yaxes(showgrid=False, zeroline=True, zerolinecolor='black', zerolinewidth=3, showticklabels=False)
fig.update_layout(height=200, plot_bgcolor='white')
fig.show()