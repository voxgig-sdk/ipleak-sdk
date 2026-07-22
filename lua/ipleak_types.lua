-- Typed models for the Ipleak SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class IpInformation
---@field asn? string
---@field asn_org? string
---@field city? string
---@field country_code? string
---@field country_name? string
---@field ip? string
---@field isp? string
---@field latitude? number
---@field longitude? number
---@field postal_code? string
---@field region? string
---@field timezone? string

---@class IpInformationLoadMatch
---@field ip string

local M = {}

return M
