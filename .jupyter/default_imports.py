import glob
from collections import (
        defaultdict,
        OrderedDict,
        )
import datetime
from importlib import reload
from functools import partial
from itertools import combinations, product
import logging
import os
from pathlib import Path
from pprint import pprint
import sys
import warnings

warnings.simplefilter(action='ignore', category=FutureWarning)
reload(logging)
logging.basicConfig(
    format="%(asctime)s %(levelname)s:%(message)s",
    level=logging.WARN,
    datefmt="%I:%M:%S",
)
LOGGER = logging.getLogger(__name__)
