# Ipleak SDK utility: make_context

from core.context import IpleakContext


def make_context_util(ctxmap, basectx):
    return IpleakContext(ctxmap, basectx)
