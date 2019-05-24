import glob
from collections import (
        defaultdict,
        OrderedDict,
        )
from datetime import datetime, timedelta, timezone
from functools import partial
from itertools import combinations, product
import logging
import os
from pathlib import Path
import sys
import warnings

warnings.simplefilter(action='ignore', category=FutureWarning)
logging.basicConfig(level=logging.INFO)
