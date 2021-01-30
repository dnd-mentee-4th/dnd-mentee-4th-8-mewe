import { Entity, Column } from 'typeorm';

@Entity()
export class BanModel {
    @Column()
    email: string;

    @Column()
    banEmail: string;
}