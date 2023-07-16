import { Module } from '@nestjs/common';
import { CanalController } from './canal.controller';
import { CanalRepository } from './repositories/canal-repository';
import { PrismaCanalRepository } from './repositories/prisma/prisma-canal-repository';
import { PrismaService } from 'src/database/prima.service';

@Module({
  controllers: [CanalController],
  providers: [
    PrismaService,
    {
      provide: CanalRepository,
      useClass: PrismaCanalRepository
    }
  ]
})
export class CanalModule {}
