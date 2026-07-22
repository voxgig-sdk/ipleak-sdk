<?php
declare(strict_types=1);

// Typed models for the Ipleak SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** IpInformation entity data model. */
class IpInformation
{
    public ?string $asn = null;
    public ?string $asn_org = null;
    public ?string $city = null;
    public ?string $country_code = null;
    public ?string $country_name = null;
    public ?string $ip = null;
    public ?string $isp = null;
    public ?float $latitude = null;
    public ?float $longitude = null;
    public ?string $postal_code = null;
    public ?string $region = null;
    public ?string $timezone = null;
}

/** Request payload for IpInformation#load. */
class IpInformationLoadMatch
{
    public string $ip;
}

