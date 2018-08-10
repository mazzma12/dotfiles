import cufflinks
import numpy as np
import pandas as pd
from sklearn.ensemble import (
        AdaBoostClassifier,
        GradientBoostingRegressor,
        RandomForestClassifier,
        )
from sklearn.feature_selection import (
        RFECV,
        )
from sklearn.linear_model import (
        ElasticNet,
        ElasticNetCV,
        SGDClassifier,
        SGDRegressor,
        Lasso,
        LassoCV,
        LinearRegression,
        HuberRegressor,
        Ridge,
        RidgeCV,
        )
from sklearn.metrics import (
        accuracy_score,
        confusion_matrix,
        homogeneity_score,
        mean_absolute_error,
        mean_squared_error,
        roc_auc_score,
        )
from sklearn.model_selection import (
        TimeSeriesSplit,
        GridSearchCV
)
from sklearn.pipeline import (
        make_pipeline,
        Pipeline
        )
from sklearn.preprocessing import (
        PolynomialFeatures,
        StandardScaler,
        MinMaxScaler
        )
from tqdm import tqdm
