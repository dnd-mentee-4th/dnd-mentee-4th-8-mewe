export type UserType = {
    'email': string,
    'nickname': string,
    'block' : boolean,
    'friends'? : string[],
    'banList'?: string[]
}