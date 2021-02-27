import { Injectable } from '@nestjs/common';
import { TypeOrmOptionsFactory, TypeOrmModuleOptions } from '@nestjs/typeorm';
import { config } from 'dotenv';

config();

@Injectable()
export class TypeOrmConfigService implements TypeOrmOptionsFactory {
  // constructor(private readonly configService: ConfigService) { }
  createTypeOrmOptions(): TypeOrmModuleOptions {
    // const database = this.configService.get<DatabaseSecret>('database');

    return {
      host: process.env.DATABASE_HOST,
      port: 3306,
      username: process.env.DATABASE_USER,
      password: process.env.DATABASE_PASSWORD,
      database: process.env.DATABASE_NAME,
      timezone: 'Asia/Seoul',
      synchronize: true,
      entities: [`${__dirname}/../resources/**/*.entity{.ts,.js}`],
    };
  }
}
