#!/bin/bash
set -x
pip install -r requirements.txt
jupyter labextension install jupyterlab-plotly@4.8.0 

set +x
