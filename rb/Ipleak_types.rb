# frozen_string_literal: true

# Typed models for the Ipleak SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# IpInformation entity data model.
#
# @!attribute [rw] asn
#   @return [String, nil]
#
# @!attribute [rw] asn_org
#   @return [String, nil]
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] country_code
#   @return [String, nil]
#
# @!attribute [rw] country_name
#   @return [String, nil]
#
# @!attribute [rw] ip
#   @return [String, nil]
#
# @!attribute [rw] isp
#   @return [String, nil]
#
# @!attribute [rw] latitude
#   @return [Float, nil]
#
# @!attribute [rw] longitude
#   @return [Float, nil]
#
# @!attribute [rw] postal_code
#   @return [String, nil]
#
# @!attribute [rw] region
#   @return [String, nil]
#
# @!attribute [rw] timezone
#   @return [String, nil]
IpInformation = Struct.new(
  :asn,
  :asn_org,
  :city,
  :country_code,
  :country_name,
  :ip,
  :isp,
  :latitude,
  :longitude,
  :postal_code,
  :region,
  :timezone,
  keyword_init: true
)

# Request payload for IpInformation#load.
#
# @!attribute [rw] ip
#   @return [String]
IpInformationLoadMatch = Struct.new(
  :ip,
  keyword_init: true
)

