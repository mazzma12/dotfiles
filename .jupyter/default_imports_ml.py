import cufflinks
import numpy as np
import pandas as pd
from sklearn.preprocessing import (
        scale,
        StandardScaler,
        MinMaxScaler)
from sklearn.linear_model import (
        Lasso,
        LassoCV,
        LinearRegression,
        HuberRegressor,
        Ridge,
        RidgeCV,
        ElasticNet
        )
from sklearn.metrics import (
        mean_absolute_error,
        mean_squared_error,
        accuracy_score,
        homogeneity_score,
        roc_auc_score
        )
from sklearn.feature_selection import RFECV
from sklearn.model_selection import GridSearchCV
from tqdm import tqdm
