import { Controller, Get } from '@nestjs/common';
import { UserModel } from './../models/user.model';
import { UserService } from './../services/user.service';

@Controller()
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Get()
  async getMewe(): Promise<UserModel> {
    return this.userService.findOne('mewe');
  }
}
