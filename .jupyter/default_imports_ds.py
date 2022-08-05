import dotenv
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import plotly.express as px
from tqdm.auto import tqdm

plt.style.use("seaborn" )
pd.options.plotting.backend = "plotly"
pd.options.display.max_columns = 60
pd.options.display.max_rows = 60
dotenv.load_dotenv(verbose=True)
