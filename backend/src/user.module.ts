import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserService } from './services/user.service';
import { UserController } from './controllers/user.controller';
import { UserModel } from './models/user.model';

@Module({
  imports: [TypeOrmModule.forFeature([UserModel])],
  providers: [UserService],
  controllers: [UserController],
})
export class UserModule {}