import { Module } from '@nestjs/common';
import { UserController } from './user/user.controller';
import { UserModule } from './user/user.module';
import { EmotionController } from './emotion/emotion.controller';
import { EmotionModule } from './emotion/emotion.module';
import { EmotionRecordModule } from './emotion-record/emotion-record.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppService } from './app.service';
import { AppController } from './app.controller';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    // TypeOrmModule.forRootAsync({
    //   useClass: TypeOrmConfigService,
    // }),
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'database-1.cebn0tm9t8p4.us-east-2.rds.amazonaws.com',
      port: 3306,
      username: 'admin',
      password: '00000000',
      timezone: 'Asia/Seoul',
      database: 'database-1',
      synchronize: true,
      autoLoadEntities: true,
    }),
    UserModule, 
    EmotionModule, 
    EmotionRecordModule],
  controllers: [AppController],
  providers: [AppService], 
})
export class AppModule {}
