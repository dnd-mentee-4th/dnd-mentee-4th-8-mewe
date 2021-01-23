import * as pino from 'pino';
import { LOG_LEVEL } from './const';

export const logger = pino.default({
    'name': 'meweLogger',
    'level': LOG_LEVEL,
    'prettyPrint': { translateTime: true, crlf: false }
});