#!/bin/bash
set -x
pip install -r requirements.txt
jupyter labextension install jupyterlab-plotly
set +x
