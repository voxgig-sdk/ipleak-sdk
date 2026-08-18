# Ipleak SDK configuration


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "Ipleak",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://ipleak.net",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "ip_information": {},
            },
        },
        "entity": {
      "ip_information": {
        "fields": [
          {
            "name": "asn",
            "type": "`$STRING`",
          },
          {
            "name": "asn_org",
            "type": "`$STRING`",
          },
          {
            "name": "city",
            "type": "`$STRING`",
          },
          {
            "name": "country_code",
            "type": "`$STRING`",
          },
          {
            "name": "country_name",
            "type": "`$STRING`",
          },
          {
            "name": "ip",
            "type": "`$STRING`",
          },
          {
            "name": "isp",
            "type": "`$STRING`",
          },
          {
            "name": "latitude",
            "type": "`$NUMBER`",
          },
          {
            "name": "longitude",
            "type": "`$NUMBER`",
          },
          {
            "name": "postal_code",
            "type": "`$STRING`",
          },
          {
            "name": "region",
            "type": "`$STRING`",
          },
          {
            "name": "timezone",
            "type": "`$STRING`",
          },
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
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/json/{ip}",
                "parts": [
                  "json",
                  "{ip}",
                ],
                "select": {
                  "exist": [
                    "ip",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [
            [
              "json",
            ],
          ],
        },
      },
    },
    }
