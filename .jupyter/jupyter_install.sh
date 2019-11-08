#!/bin/bash
pip install -r requirements.txt
jupyter nbextensions_configurator enable --user
jupyter nbextension install https://github.com/drillan/jupyter-black/archive/master.zip --user
jupyter nbextension enable jupyter-black-master/jupyter-black
jupyter nbextension enable table-of-contents2
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable jupyter-js-widgets/extension
jupyter nbextension enable table-of-contents
jupyter nbextension enable --py widgetsnbextension

jt -t oceans16 -tf merriserif -tfs 10 -nf ptsans -nfs 13 -cellw 90%
