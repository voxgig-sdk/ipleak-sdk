
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'Ipleak',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
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
          "type": "`$STRING`"
        },
        {
          "name": "asn_org",
          "type": "`$STRING`"
        },
        {
          "name": "city",
          "type": "`$STRING`"
        },
        {
          "name": "country_code",
          "type": "`$STRING`"
        },
        {
          "name": "country_name",
          "type": "`$STRING`"
        },
        {
          "name": "ip",
          "type": "`$STRING`"
        },
        {
          "name": "isp",
          "type": "`$STRING`"
        },
        {
          "name": "latitude",
          "type": "`$NUMBER`"
        },
        {
          "name": "longitude",
          "type": "`$NUMBER`"
        },
        {
          "name": "postal_code",
          "type": "`$STRING`"
        },
        {
          "name": "region",
          "type": "`$STRING`"
        },
        {
          "name": "timezone",
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
              "parts": [
                "json",
                "{ip}"
              ],
              "select": {
                "exist": [
                  "ip"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
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
  config
}

