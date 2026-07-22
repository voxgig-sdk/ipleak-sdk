<?php
declare(strict_types=1);

// Ipleak SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class IpleakMakeContext
{
    public static function call(array $ctxmap, ?IpleakContext $basectx): IpleakContext
    {
        return new IpleakContext($ctxmap, $basectx);
    }
}
