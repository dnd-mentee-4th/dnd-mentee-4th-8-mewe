import { logger } from '../logger';

export class isNotExistException extends Error {
    constructor(msg: string){
        logger.error(`[isNotExist]: ${msg}`);
        super(msg);
    }
}