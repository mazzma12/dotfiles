# Convenient one liners from the standard library
from collections import OrderedDict
import logging


def debug_packages(*packages):
    (logging.getLogger(pp).setLevel('DEBUG') for pp in packages)


def _join(*items):
    return '_'.join(map(str, items))


def sort_dict(d, reverse=False):
    return OrderedDict((sorted_key, d[sorted_key]) for sorted_key in sorted(d, key=d.get, reverse=reverse))
