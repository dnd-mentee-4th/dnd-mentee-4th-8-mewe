
import { Entity, Column, OneToMany, PrimaryColumn } from 'typeorm';
import { EmotionRecordEntity } from '../../emotion-record/entities/emotion_record.entity';

@Entity('user')
export class UserEntity {
	@PrimaryColumn()
	id: number;

	@PrimaryColumn()
	account_type: 'kakao' | 'apple' | 'local' | 'google';

	@Column()
	username!: string;

	@Column({ default: null })
	thumbnaile_image_url!: string;

	@Column({ default: null })
	email!: string;

	@Column({ default: null })
	age_range!: string;

	@Column({ default: null })
	gender!: string;

	@Column({ default: null })
	birthday!: string;

	@Column({ default: null })
	phone_number!: string;


	@Column({ default: '' })
	refreshToken: string;

	@Column({ type: 'double', default: 37.5665 })
	longitude: number;

	@Column({ type: 'double', default: 126.9780 })
	latitude: string;

	@Column({ default: true })
	isFirst: boolean;

	@Column({ default: false })
	login_locationAgree: boolean;

	@Column({ default: false })
	login_marketingPushAgree: boolean;


	@Column({ default: false })
	collectInfoAgree: boolean;


	@Column({ default: '' })
	nickName: string;

	/**
	 * User | EmotionRecord => 1:N
	 */
	@OneToMany(() => EmotionRecordEntity, emotion_record => emotion_record.user)
	emotion_record?: EmotionRecordEntity[];

}
