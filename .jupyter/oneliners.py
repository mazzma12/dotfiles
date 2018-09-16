# Convenient one liners from the standard library
import logging


def debug_packages(*packages):
    (logging.getLogger(pp).setLevel('DEBUG') for pp in packages)


def _join(*items):
    return '_'.join(map(str, items))
