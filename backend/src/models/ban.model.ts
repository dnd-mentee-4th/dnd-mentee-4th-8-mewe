import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class BanModel {
    @PrimaryGeneratedColumn()
    idx: number;

    @Column()
    email: string;

    @Column()
    banEmail: string;
}