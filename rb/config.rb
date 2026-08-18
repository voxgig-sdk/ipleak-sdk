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
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
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
              "type" => "`$STRING`",
            },
            {
              "name" => "asn_org",
              "type" => "`$STRING`",
            },
            {
              "name" => "city",
              "type" => "`$STRING`",
            },
            {
              "name" => "country_code",
              "type" => "`$STRING`",
            },
            {
              "name" => "country_name",
              "type" => "`$STRING`",
            },
            {
              "name" => "ip",
              "type" => "`$STRING`",
            },
            {
              "name" => "isp",
              "type" => "`$STRING`",
            },
            {
              "name" => "latitude",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "longitude",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "postal_code",
              "type" => "`$STRING`",
            },
            {
              "name" => "region",
              "type" => "`$STRING`",
            },
            {
              "name" => "timezone",
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
                  "parts" => [
                    "json",
                    "{ip}",
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
