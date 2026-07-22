<?php
declare(strict_types=1);

// Ipleak SDK utility: prepare_body

class IpleakPrepareBody
{
    public static function call(IpleakContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
