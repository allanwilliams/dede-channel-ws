import { Module } from '@nestjs/common';
import { MensagemController } from './mensagem.controller';
import { MensagemRepository } from './repositories/mensagem-repository';
import { PrismaMensagemRepository } from './repositories/prisma/prisma-mensagem-repository';
import { PrismaService } from 'src/database/prima.service';

@Module({
  controllers: [MensagemController],
  providers: [
    PrismaService,
    {
      provide: MensagemRepository,
      useClass: PrismaMensagemRepository
    }
  ]
})
export class MensagemModule {}
