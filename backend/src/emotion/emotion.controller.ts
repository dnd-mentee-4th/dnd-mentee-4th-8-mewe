import { Controller, Get, Query } from '@nestjs/common';
import { EmotionService } from './emotion.service';
import { EmotionEntity } from './entities/emotion.entity';

@Controller('emotion')
export class EmotionController {

constructor(
    private readonly emotionService: EmotionService
){}



@Get()
async findOne(
  @Query('id') id: string,
): Promise<EmotionEntity> {
  return this.emotionService.findOne(id);
}



}
