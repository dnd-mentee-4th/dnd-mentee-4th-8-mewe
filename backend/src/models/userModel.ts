import { logger } from "../utils/logger";
import { UserType } from "./types/user";

export class UserModel {
    private user: UserType;

    constructor(user: UserType) {
        this.user = user;
        if (!this.user.friends) {
            this.user.friends = [];
        }
        if (!this.user.banList) {
            this.user.banList = [];
        }
    }

    public get(): UserType {
        return this.user;
    }

    public getEmail(): string {
        return this.user.email;
    }

    public getName(): string {
        return this.user.nickname;
    }

    public isBlock(): boolean {
        return this.user.block;
    }

    public getFriends(): string[] {
        return this.user.friends;
    }

    public getBanList(): string[] {
        return this.user.banList;
    }

    public setName(nickname: string) {
        this.user.nickname = nickname;
    }

    public addFriend(friendEmail: string) {
        try {
            this.user.friends.push(friendEmail);
        } catch (error) {
            logger.error('user.addFriend(friendEmail: string)');
            throw new Error(error);
        }
    }

    public addUserToBanList(userEmail: string) {
        try {
            this.user.banList.push(userEmail);
        } catch (error) {
            logger.error('user.addUserToBanList(userEmail: string)');
            throw new Error(error);
        }
    }

    public block() {
        this.user.block = true;
    }

    public unblock() {
        this.user.block = false;
    }
}