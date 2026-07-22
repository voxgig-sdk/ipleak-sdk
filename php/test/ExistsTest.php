<?php
declare(strict_types=1);

// Ipleak SDK exists test

require_once __DIR__ . '/../ipleak_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = IpleakSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
