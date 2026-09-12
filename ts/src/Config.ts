
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. Named imports above make each definition statically reachable, so
// an SDK carries exactly the plugin modules its model selects — the same
// leanness the old side-effect registry imports bought, without a registry.
const FEATURE_PLUGINS: Record<string, any[]> = {
  
}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'Ipleak',
        slug: "ipleak",
    version: "0.0.1",
    target: "ts",

  }


  feature = {
     test:     {
      "options": {
        "active": false
      },
      "transport": "base"
    },

  }


  options = {
    base: "https://ipleak.net",

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      ip_information: {
      },

    }
  }


  entity = {
    "ip_information": {
      "fields": [
        {
          "name": "asn",
          "short": "Autonomous System Number",
          "type": "`$STRING`"
        },
        {
          "name": "asn_org",
          "short": "Organization associated with the ASN",
          "type": "`$STRING`"
        },
        {
          "name": "city",
          "short": "City name",
          "type": "`$STRING`"
        },
        {
          "name": "country_code",
          "short": "ISO country code",
          "type": "`$STRING`"
        },
        {
          "name": "country_name",
          "short": "Country name",
          "type": "`$STRING`"
        },
        {
          "name": "ip",
          "short": "The IP address queried",
          "type": "`$STRING`"
        },
        {
          "name": "isp",
          "short": "Internet Service Provider",
          "type": "`$STRING`"
        },
        {
          "format": "float",
          "name": "latitude",
          "short": "Latitude coordinate",
          "type": "`$NUMBER`"
        },
        {
          "format": "float",
          "name": "longitude",
          "short": "Longitude coordinate",
          "type": "`$NUMBER`"
        },
        {
          "name": "postal_code",
          "short": "Postal code",
          "type": "`$STRING`"
        },
        {
          "name": "region",
          "short": "Region or state",
          "type": "`$STRING`"
        },
        {
          "name": "timezone",
          "short": "Timezone of the IP location",
          "type": "`$STRING`"
        }
      ],
      "name": "ip_information",
      "op": {
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "example": "1.1.1.1",
                    "kind": "param",
                    "name": "ip",
                    "orig": "ip",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/json/{ip}",
              "segments": [
                {
                  "lit": "json"
                },
                {
                  "var": "ip"
                }
              ],
              "select": {
                "exist": [
                  "ip"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "parts": [
                "json",
                "{ip}"
              ]
            }
          ]
        }
      },
      "relations": {
        "ancestors": [
          [
            "json"
          ]
        ]
      }
    }
  }
}


const config = new Config()

export {
  config,
  FEATURE_PLUGINS,
}

