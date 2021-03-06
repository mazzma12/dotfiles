import glob
from collections import (
        defaultdict,
        OrderedDict,
        )
import datetime
from functools import partial
from itertools import combinations, product
import logging
import os
from pathlib import Path
from pprint import pprint
import sys
import warnings

warnings.simplefilter(action='ignore', category=FutureWarning)
logging.basicConfig(level=logging.INFO)
