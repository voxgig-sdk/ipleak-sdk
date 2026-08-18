-- Ipleak SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "Ipleak",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
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
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "asn_org",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "city",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "country_code",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "country_name",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "ip",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "isp",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "latitude",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "longitude",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "postal_code",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "region",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "timezone",
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
