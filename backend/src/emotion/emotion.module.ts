import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { EmotionRecordEntity } from '../emotion-record/entities/emotion_record.entity';
import { EmotionController } from './emotion.controller';
import { EmotionService } from './emotion.service';
import { EmotionEntity } from './entities/emotion.entity';

@Module({
  imports: [TypeOrmModule.forFeature([EmotionEntity,EmotionRecordEntity])],
  providers: [EmotionService],
  controllers: [EmotionController]
})
export class EmotionModule {}
