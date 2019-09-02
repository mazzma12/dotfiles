# Convenient one liners from the standard library
import datetime
from collections import OrderedDict
import logging


def debug_packages(*packages):
    (logging.getLogger(pp).setLevel('DEBUG') for pp in packages)


def _join(*items):
    return '_'.join(map(str, items))


def sort_dict(d, reverse=False):
    return OrderedDict((sorted_key, d[sorted_key]) for sorted_key in sorted(d, key=d.get, reverse=reverse))


def _join_suffix(*items, suffix=('x', 'y'), sep='_'):
    return [sep.join([it, ss]) for it in items for ss in suffix]


def format_string_with_utc(s):
    return '_'.join([datetime.datetime.utcnow().strftime("%Y%m%d%H%M%S"), s])
