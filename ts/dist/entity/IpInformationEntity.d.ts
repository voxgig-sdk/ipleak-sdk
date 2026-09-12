import { IpleakEntityBase } from '../IpleakEntityBase';
import type { IpleakSDK } from '../IpleakSDK';
import type { Control } from '../types';
import type { IpInformation, IpInformationLoadMatch } from '../IpleakTypes';
declare class IpInformationEntity extends IpleakEntityBase<IpInformation> {
    constructor(client: IpleakSDK, entopts: any);
    make(this: IpInformationEntity): IpInformationEntity;
    load(this: any, reqmatch?: IpInformationLoadMatch, ctrl?: Control): Promise<IpInformationEntity>;
}
export { IpInformationEntity };
