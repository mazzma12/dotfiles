import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import plotly
import plotly.graph_objects as go
import plotly.express as px
import seaborn as sns
from sklearn.cluster import KMeans
from sklearn.decomposition import TruncatedSVD, PCA, IncrementalPCA
from sklearn.ensemble import (
    AdaBoostClassifier,
    GradientBoostingRegressor,
    RandomForestClassifier,
    RandomForestRegressor,
)
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
from sklearn.feature_selection import RFECV
from sklearn.linear_model import (
    ElasticNet,
    ElasticNetCV,
    SGDClassifier,
    SGDRegressor,
    Lasso,
    LassoCV,
    LinearRegression,
    LogisticRegression,
    LogisticRegressionCV,
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
    StratifiedKFold,
    train_test_split,
    GridSearchCV,
)
from sklearn.pipeline import make_pipeline, Pipeline
from sklearn.preprocessing import (
    FunctionTransformer,
    PolynomialFeatures,
    StandardScaler,
    MinMaxScaler,
    LabelEncoder,
)
from tqdm import tqdm_notebook as tqdm

# cf.go_offline()
np.random.seed(42)
sns.set()

if __name__ == "__main__":
    df = None
    features = []
    target = []
    X_df = df[features].copy()
    y_df = df[target].copy()
    X_train_df, X_test_df, y_train_df, y_test_df = train_test_split(
        X_df, y_df, stratify=df["source_id"]
    )
    rf = RandomForestRegressor()
    rf.fit(X_train_df.values, y_train_df.values.ravel())
    y_pred = rf.predict(X_test_df)
    ((y_pred - y_test_df.values.ravel()) ** 2).mean()
