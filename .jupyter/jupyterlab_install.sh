#!/bin/bash
set -x
pip install -r requirements_lab.txt
jupyter labextension install jupyterlab-plotly
set +x
