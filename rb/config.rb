# Ipleak SDK configuration

module IpleakConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "Ipleak",
        "slug" => "ipleak",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
          "transport" => "base",
        },
      },
      "options" => {
        "base" => "https://ipleak.net",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "ip_information" => {},
        },
      },
      "entity" => {
        "ip_information" => {
          "fields" => [
            {
              "name" => "asn",
              "short" => "Autonomous System Number",
              "type" => "`$STRING`",
            },
            {
              "name" => "asn_org",
              "short" => "Organization associated with the ASN",
              "type" => "`$STRING`",
            },
            {
              "name" => "city",
              "short" => "City name",
              "type" => "`$STRING`",
            },
            {
              "name" => "country_code",
              "short" => "ISO country code",
              "type" => "`$STRING`",
            },
            {
              "name" => "country_name",
              "short" => "Country name",
              "type" => "`$STRING`",
            },
            {
              "name" => "ip",
              "short" => "The IP address queried",
              "type" => "`$STRING`",
            },
            {
              "name" => "isp",
              "short" => "Internet Service Provider",
              "type" => "`$STRING`",
            },
            {
              "format" => "float",
              "name" => "latitude",
              "short" => "Latitude coordinate",
              "type" => "`$NUMBER`",
            },
            {
              "format" => "float",
              "name" => "longitude",
              "short" => "Longitude coordinate",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "postal_code",
              "short" => "Postal code",
              "type" => "`$STRING`",
            },
            {
              "name" => "region",
              "short" => "Region or state",
              "type" => "`$STRING`",
            },
            {
              "name" => "timezone",
              "short" => "Timezone of the IP location",
              "type" => "`$STRING`",
            },
          ],
          "name" => "ip_information",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "1.1.1.1",
                        "kind" => "param",
                        "name" => "ip",
                        "orig" => "ip",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/json/{ip}",
                  "segments" => [
                    {
                      "lit" => "json",
                    },
                    {
                      "var" => "ip",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "ip",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "json",
                    "{ip}",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "json",
              ],
            ],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    IpleakFeatures.make_feature(name)
  end
end
