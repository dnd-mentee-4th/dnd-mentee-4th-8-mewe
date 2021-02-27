import { Injectable } from '@nestjs/common';
import { EmotionEntity } from './entities/emotion.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

@Injectable()
export class EmotionService {
    constructor(
        /* 카카오페이 결제 entity */
    @InjectRepository(EmotionEntity)
    private readonly EmotionRepository: Repository<EmotionEntity>,
    
    ) {}

    /**
 * 카카오페이 결제데이터 조회를위한 메소드
 * @param id 조회할 결제데이터 번호
 */
  public async findOne(id: string): Promise<EmotionEntity> {
    return this.EmotionRepository.findOne(id);
  }

      

}
