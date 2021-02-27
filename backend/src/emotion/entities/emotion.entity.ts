import {
    Column, PrimaryGeneratedColumn, Entity, JoinColumn, OneToOne,
  } from 'typeorm';
  import { Emotion, EmotionRecord } from '../../shared/interfaces/emotion.interface';
  import { EmotionRecordEntity} from '../../emotion-record/entities/emotion_record.entity';
  /*
  결제요청시 데이터를 담는 테이블 
  결제 처리시 요금관련 테이블
   */
  @Entity({ name: 'amount' })
  export class EmotionEntity implements Emotion {
  @PrimaryGeneratedColumn()
  id: number;
  
//   @Column({
//     type: 'varchar',
//     length: 50,
//   })
//   statistics_id: string;
  
  @Column({ nullable: true })
  anger: number;
  
  @Column({ nullable: true })
  concern: number;
  
  @Column({ nullable: true })
  ease: number;
  
  @Column({ nullable: true })
  frustration: number;
  
  @Column({ nullable: true })
  happiness: number;
    
  @Column({ nullable: true })
  heart: number;  

  @Column({ nullable: true })
  joy: number;

  @Column({ nullable: true })
  proud: number;

  @Column({ nullable: true })
  sadness: number;
    
  @Column({ nullable: true })
  tiredness: number;
  
  @OneToOne(() => EmotionRecordEntity, (emotion_record: any) => emotion_record.emotion)
  @JoinColumn()
  emotion_record: EmotionRecordEntity;
  }
  