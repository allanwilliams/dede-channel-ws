import { Module } from '@nestjs/common';
import { AssistidoService } from './assistido.service';
import { AssistidoController } from './assistido.controller';
import { PrismaService } from 'src/database/prima.service';
import { AssistidoRepository } from './repositories/assistido-repository';
import { PrismaAssistidoRepository } from './repositories/prisma/prisma-assistido-repository';

@Module({
  controllers: [AssistidoController],
  providers: [
    PrismaService,
    {
      provide: AssistidoRepository,
      useClass: PrismaAssistidoRepository
    }
  ]
})
export class AssistidoModule {}
