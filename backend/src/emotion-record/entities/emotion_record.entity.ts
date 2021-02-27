import { UserEntity } from '../../user/entities/user.entity';
import {
    Column, PrimaryGeneratedColumn, Entity, JoinColumn, OneToOne, Double, ManyToOne,
  } from 'typeorm';
import { NumericLiteral } from 'typescript';
  import { EmotionRecord } from '../../shared/interfaces/emotion.interface';
  import {EmotionEntity} from '../../emotion/entities/emotion.entity';
  /*
  결제요청시 데이터를 담는 테이블 
  결제 처리시 요금관련 테이블
   */
  @Entity({ name: 'amount' })
  export class EmotionRecordEntity implements EmotionRecord {
  @PrimaryGeneratedColumn()
  id: number;
  
  /**
   *  User | EmotionRecord => 1:N
  */
 @ManyToOne(() => UserEntity, (user: any) => user.emotion_record)
  @JoinColumn([
    { referencedColumnName: 'id', name: 'user_id' },
])
user?: UserEntity;

  @Column({ nullable: true })
  representitive_emoji: string;
  
  @Column({ nullable: true })
  selected_emoji: string;
  
  @Column({ type: 'timestamp',nullable: true })
  recordAt: Date;
  
  @Column({ type: 'double' })
  longitude: number;

  @Column({ type: 'double' })
  latitude: number;

  @Column({  default: false })
  is_lock: boolean;
  
  @OneToOne(() => EmotionEntity, (emotion: any) => emotion.emotion_record)
  @JoinColumn()
  emotion: EmotionEntity;
  }
  