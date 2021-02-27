import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserEntity } from '../user/entities/user.entity';
import { EmotionEntity } from '../emotion/entities/emotion.entity';
import { EmotionRecordController } from './emotion-record.controller';
import { EmotionRecordService } from './emotion-record.service';
import { EmotionRecordEntity } from './entities/emotion_record.entity';

@Module({
  imports: [TypeOrmModule.forFeature([EmotionRecordEntity,EmotionEntity,UserEntity])],
  controllers: [EmotionRecordController],
  providers: [EmotionRecordService]
})
export class EmotionRecordModule {}
