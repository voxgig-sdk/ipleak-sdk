<?php
declare(strict_types=1);

// Ipleak SDK utility: result_headers

class IpleakResultHeaders
{
    public static function call(IpleakContext $ctx): ?IpleakResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
