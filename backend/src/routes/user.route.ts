import { Module } from '@nestjs/common';
import { UserModule } from './../user.module';
import { UserService } from './../services/user.service';
import { UserController } from './../controllers/user.controller';

@Module({
  imports: [UserModule],
  providers: [UserService],
  controllers: [UserController]
})
export class UserRouteModule {}
