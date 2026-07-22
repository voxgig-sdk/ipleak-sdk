# Ipleak SDK exists test

require "minitest/autorun"
require_relative "../Ipleak_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = IpleakSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
