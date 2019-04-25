import numpy as np
from sklearn.linear_model import (
    LinearRegression,
    ElasticNetCV
)
from sklearn.metrics import (
    mean_absolute_error,
    mean_squared_error,
)
from sklearn.model_selection import train_test_split
from sklearn import datasets

np.random.seed(42)

# Load
dataset = datasets.load_boston()
X = dataset['data']
y = dataset['target']

# Split
X_train, X_test, y_train, y_test = train_test_split(X, y, train_size=0.7)

# Train
model = LinearRegression(
    normalize=True,
    fit_intercept=True,
    n_jobs=-1
)
model = ElasticNetCV(
    normalize=True,
    fit_intercept=True,
    n_jobs=-1
)
model.fit(X_train, y_train)

# Predict
y_pred = model.predict(X_test)
mae = mean_absolute_error(y_test, y_pred)
