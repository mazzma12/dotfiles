import cufflinks
import numpy as np
import pandas as pd
from sklearn.decomposition import (
    TruncatedSVD,
    PCA,
    IncrementalPCA
)
from sklearn.ensemble import (
    AdaBoostClassifier,
    GradientBoostingRegressor,
    RandomForestClassifier,
)
from sklearn.feature_extraction.text import (
    CountVectorizer,
    TfidfVectorizer,
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
    GridSearchCV
)
from sklearn.pipeline import (
    make_pipeline,
    Pipeline
)
from sklearn.preprocessing import (
    FunctionTransformer,
    PolynomialFeatures,
    StandardScaler,
    MinMaxScaler,
    LabelEncoder,
)
from tqdm import tqdm
