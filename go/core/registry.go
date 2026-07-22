package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewIpInformationEntityFunc func(client *IpleakSDK, entopts map[string]any) IpleakEntity

