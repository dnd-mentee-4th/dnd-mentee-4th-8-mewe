import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class FriendModel {
    @PrimaryGeneratedColumn()
    idx: number;

    @Column()
    email: string;

    @Column()
    friendEmail: string;
}