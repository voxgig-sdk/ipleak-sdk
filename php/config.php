<?php
declare(strict_types=1);

// Ipleak SDK configuration

class IpleakConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "Ipleak",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://ipleak.net",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "ip_information" => [],
                ],
            ],
            "entity" => [
        'ip_information' => [
          'fields' => [
            [
              'name' => 'asn',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'asn_org',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'city',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'country_code',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'country_name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'ip',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'isp',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'latitude',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'longitude',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'postal_code',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'region',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'timezone',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'ip_information',
          'op' => [
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'args' => [
                    'params' => [
                      [
                        'example' => '1.1.1.1',
                        'kind' => 'param',
                        'name' => 'ip',
                        'orig' => 'ip',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/json/{ip}',
                  'parts' => [
                    'json',
                    '{ip}',
                  ],
                  'select' => [
                    'exist' => [
                      'ip',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [
              [
                'json',
              ],
            ],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return IpleakFeatures::make_feature($name);
    }
}
