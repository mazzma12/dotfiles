# Convenient one liners from the standard library
import datetime
import logging


def debug_packages(*packages):
    (logging.getLogger(pp).setLevel("DEBUG") for pp in packages)


def _join(*items):
    return "_".join(map(str, items))


def sort_dict(d: dict, reverse: bool = False) -> dict:
    return dict(
        (sorted_key, d[sorted_key])
        for sorted_key in sorted(d, key=d.get, reverse=reverse)
    )


def _join_suffix(*items, suffix=("x", "y"), sep="_"):
    return [sep.join([it, ss]) for it in items for ss in suffix]


def format_string_with_utc(s):
    return "_".join(
        filter(None, [datetime.datetime.utcnow().strftime("%Y%m%d%H%M%S"), s])
    )

def chunks(lst, n):
    """Yield successive n-sized chunks from lst."""
    for i in range(0, len(lst), n):
        yield lst[i : i + n]

def chunk(l, size):
    return [l[i : i + size] for i in range(0, len(l), size)]

def get_first(iterable, value=None, key=None, default=None):
    """
    References: https://realpython.com/python-first-match/
    """
    match value is None, callable(key):
        case (True, True):
            gen = (elem for elem in iterable if key(elem))
        case (False, True):
            gen = (elem for elem in iterable if key(elem) == value)
        case (True, False):
            gen = (elem for elem in iterable if elem)
        case (False, False):
            gen = (elem for elem in iterable if elem == value)

    return next(gen, default)
