-- Ipleak SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "Ipleak",
      slug = "ipleak",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["transport"] = "base",
      },
    },
    options = {
      base = "https://ipleak.net",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["ip_information"] = {},
      },
    },
    entity = {
      ["ip_information"] = {
        ["fields"] = {
          {
            ["name"] = "asn",
            ["short"] = "Autonomous System Number",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "asn_org",
            ["short"] = "Organization associated with the ASN",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "city",
            ["short"] = "City name",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "country_code",
            ["short"] = "ISO country code",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "country_name",
            ["short"] = "Country name",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "ip",
            ["short"] = "The IP address queried",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "isp",
            ["short"] = "Internet Service Provider",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "latitude",
            ["short"] = "Latitude coordinate",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "longitude",
            ["short"] = "Longitude coordinate",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "postal_code",
            ["short"] = "Postal code",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "region",
            ["short"] = "Region or state",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "timezone",
            ["short"] = "Timezone of the IP location",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "ip_information",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["example"] = "1.1.1.1",
                      ["kind"] = "param",
                      ["name"] = "ip",
                      ["orig"] = "ip",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/json/{ip}",
                ["parts"] = {
                  "json",
                  "{ip}",
                },
                ["select"] = {
                  ["exist"] = {
                    "ip",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {
            {
              "json",
            },
          },
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
