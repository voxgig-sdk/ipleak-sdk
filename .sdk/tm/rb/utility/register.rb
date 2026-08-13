# Ipleak SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'graphql'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

IpleakUtility.registrar = ->(u) {
  u.clean = IpleakUtilities::Clean
  u.done = IpleakUtilities::Done
  u.make_error = IpleakUtilities::MakeError
  u.feature_add = IpleakUtilities::FeatureAdd
  u.feature_hook = IpleakUtilities::FeatureHook
  u.feature_init = IpleakUtilities::FeatureInit
  u.fetcher = IpleakUtilities::Fetcher
  u.make_fetch_def = IpleakUtilities::MakeFetchDef
  u.make_context = IpleakUtilities::MakeContext
  u.make_options = IpleakUtilities::MakeOptions
  u.make_request = IpleakUtilities::MakeRequest
  u.make_response = IpleakUtilities::MakeResponse
  u.make_result = IpleakUtilities::MakeResult
  u.make_point = IpleakUtilities::MakePoint
  u.make_spec = IpleakUtilities::MakeSpec
  u.make_url = IpleakUtilities::MakeUrl
  u.param = IpleakUtilities::Param
  u.prepare_auth = IpleakUtilities::PrepareAuth
  u.prepare_body = IpleakUtilities::PrepareBody
  u.prepare_headers = IpleakUtilities::PrepareHeaders
  u.prepare_method = IpleakUtilities::PrepareMethod
  u.prepare_params = IpleakUtilities::PrepareParams
  u.prepare_path = IpleakUtilities::PreparePath
  u.prepare_query = IpleakUtilities::PrepareQuery
  u.graphql_body = IpleakUtilities::GraphqlBody
  u.graphql_errors = IpleakUtilities::GraphqlErrors
  u.result_basic = IpleakUtilities::ResultBasic
  u.result_body = IpleakUtilities::ResultBody
  u.result_headers = IpleakUtilities::ResultHeaders
  u.transform_request = IpleakUtilities::TransformRequest
  u.transform_response = IpleakUtilities::TransformResponse
}
