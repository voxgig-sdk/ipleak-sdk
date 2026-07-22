<?php
declare(strict_types=1);

// Ipleak SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class IpleakFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new IpleakBaseFeature();
            case "test":
                return new IpleakTestFeature();
            default:
                return new IpleakBaseFeature();
        }
    }
}
