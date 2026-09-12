package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "Ipleak",
			"slug": "ipleak",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://ipleak.net",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"ip_information": map[string]any{},
			},
		},
		"entity": map[string]any{
			"ip_information": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "asn",
						"short": "Autonomous System Number",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "asn_org",
						"short": "Organization associated with the ASN",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "city",
						"short": "City name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "country_code",
						"short": "ISO country code",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "country_name",
						"short": "Country name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "ip",
						"short": "The IP address queried",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isp",
						"short": "Internet Service Provider",
						"type": "`$STRING`",
					},
					map[string]any{
						"format": "float",
						"name": "latitude",
						"short": "Latitude coordinate",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"format": "float",
						"name": "longitude",
						"short": "Longitude coordinate",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "postal_code",
						"short": "Postal code",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "region",
						"short": "Region or state",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "timezone",
						"short": "Timezone of the IP location",
						"type": "`$STRING`",
					},
				},
				"name": "ip_information",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": "1.1.1.1",
											"kind": "param",
											"name": "ip",
											"orig": "ip",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/json/{ip}",
								"segments": []any{
									map[string]any{
										"lit": "json",
									},
									map[string]any{
										"var": "ip",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"ip",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"json",
									"{ip}",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"json",
						},
					},
				},
			},
		},
	}
}

// The plugin definitions the model selected per feature, as []any so a
// feature package can consume them without core naming its types. Empty
// when no active feature declares active plugin groups for this target.
var featurePlugins = map[string][]any{
}

// FeaturePlugins is the definitions list for one feature's chain.
func FeaturePlugins(name string) []any {
	return featurePlugins[name]
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
