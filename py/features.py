# Ipleak SDK feature factory

from feature.base_feature import IpleakBaseFeature
from feature.test_feature import IpleakTestFeature


def _make_feature(name):
    features = {
        "base": lambda: IpleakBaseFeature(),
        "test": lambda: IpleakTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
