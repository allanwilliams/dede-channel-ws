import { Module } from '@nestjs/common';
import { PrismaService } from 'src/database/prima.service';
import { AnexoController } from './anexo.controller';
import { AnexoRepository } from './repositories/anexo-repository';
import { PrismaAnexoRepository } from './repositories/prisma/prisma-anexo-repository';

@Module({
  controllers: [AnexoController],
  providers: [
    PrismaService,
    {
      provide: AnexoRepository,
      useClass: PrismaAnexoRepository
    }
  ]
})
export class AnexoModule {}
