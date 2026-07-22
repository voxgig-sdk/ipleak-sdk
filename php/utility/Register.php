<?php
declare(strict_types=1);

// Ipleak SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

IpleakUtility::setRegistrar(function (IpleakUtility $u): void {
    $u->clean = [IpleakClean::class, 'call'];
    $u->done = [IpleakDone::class, 'call'];
    $u->make_error = [IpleakMakeError::class, 'call'];
    $u->feature_add = [IpleakFeatureAdd::class, 'call'];
    $u->feature_hook = [IpleakFeatureHook::class, 'call'];
    $u->feature_init = [IpleakFeatureInit::class, 'call'];
    $u->fetcher = [IpleakFetcher::class, 'call'];
    $u->make_fetch_def = [IpleakMakeFetchDef::class, 'call'];
    $u->make_context = [IpleakMakeContext::class, 'call'];
    $u->make_options = [IpleakMakeOptions::class, 'call'];
    $u->make_request = [IpleakMakeRequest::class, 'call'];
    $u->make_response = [IpleakMakeResponse::class, 'call'];
    $u->make_result = [IpleakMakeResult::class, 'call'];
    $u->make_point = [IpleakMakePoint::class, 'call'];
    $u->make_spec = [IpleakMakeSpec::class, 'call'];
    $u->make_url = [IpleakMakeUrl::class, 'call'];
    $u->param = [IpleakParam::class, 'call'];
    $u->prepare_auth = [IpleakPrepareAuth::class, 'call'];
    $u->prepare_body = [IpleakPrepareBody::class, 'call'];
    $u->prepare_headers = [IpleakPrepareHeaders::class, 'call'];
    $u->prepare_method = [IpleakPrepareMethod::class, 'call'];
    $u->prepare_params = [IpleakPrepareParams::class, 'call'];
    $u->prepare_path = [IpleakPreparePath::class, 'call'];
    $u->prepare_query = [IpleakPrepareQuery::class, 'call'];
    $u->result_basic = [IpleakResultBasic::class, 'call'];
    $u->result_body = [IpleakResultBody::class, 'call'];
    $u->result_headers = [IpleakResultHeaders::class, 'call'];
    $u->transform_request = [IpleakTransformRequest::class, 'call'];
    $u->transform_response = [IpleakTransformResponse::class, 'call'];
});
