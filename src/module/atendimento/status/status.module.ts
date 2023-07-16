import { Module } from '@nestjs/common';
import { StatusController } from './status.controller';
import { PrismaService } from 'src/database/prima.service';
import { StatusRepository } from './repositories/status-repository';
import { PrismaStatusRepository } from './repositories/prisma/prisma-status-repository';

@Module({
  controllers: [StatusController],
  providers: [
    PrismaService,
    {
      provide: StatusRepository,
      useClass: PrismaStatusRepository
    }]
})
export class StatusModule {}
