export interface IpInformation {
    asn?: string;
    asn_org?: string;
    city?: string;
    country_code?: string;
    country_name?: string;
    ip?: string;
    isp?: string;
    latitude?: number;
    longitude?: number;
    postal_code?: string;
    region?: string;
    timezone?: string;
}
export interface IpInformationLoadMatch {
    ip: string;
}
