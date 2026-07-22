package voxgigipleaksdk

import (
	"github.com/voxgig-sdk/ipleak-sdk/go/core"
	"github.com/voxgig-sdk/ipleak-sdk/go/entity"
	"github.com/voxgig-sdk/ipleak-sdk/go/feature"
	_ "github.com/voxgig-sdk/ipleak-sdk/go/utility"
)

// Type aliases preserve external API.
type IpleakSDK = core.IpleakSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type IpleakEntity = core.IpleakEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type IpleakError = core.IpleakError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewIpInformationEntityFunc = func(client *core.IpleakSDK, entopts map[string]any) core.IpleakEntity {
		return entity.NewIpInformationEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewIpleakSDK = core.NewIpleakSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewIpleakSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *IpleakSDK  { return NewIpleakSDK(nil) }
func Test() *IpleakSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
