<?php
declare(strict_types=1);

// Ipleak SDK utility: result_body

class IpleakResultBody
{
    public static function call(IpleakContext $ctx): ?IpleakResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
