import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { FriendModel } from './friend.model';
import { BanModel } from './ban.model';

@Entity()
export class UserModel {
    @PrimaryGeneratedColumn()
    email: string;

    @Column()
    nickname: string;

    @Column({ default: false })
    block: boolean;
    
    @OneToMany(type => FriendModel, friend => friend.friendEmail)
    friends: FriendModel[];

    @OneToMany(type => BanModel, ban => ban.banEmail)
    banList: BanModel[];
}