import { Entity, Column } from 'typeorm';

@Entity()
export class FriendModel {
    @Column()
    email: string;

    @Column()
    friendEmail: string;
}