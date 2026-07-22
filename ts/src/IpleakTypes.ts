// Typed models for the Ipleak SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface IpInformation {
  asn?: string
  asn_org?: string
  city?: string
  country_code?: string
  country_name?: string
  ip?: string
  isp?: string
  latitude?: number
  longitude?: number
  postal_code?: string
  region?: string
  timezone?: string
}

export interface IpInformationLoadMatch {
  ip: string
}

