# ProjectName SDK exists test

import pytest
from ipleak_sdk import IpleakSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = IpleakSDK.test(None, None)
        assert testsdk is not None
