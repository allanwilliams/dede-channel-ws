import { Module } from '@nestjs/common';
import { TipoContatoService } from './tipo_contato.service';
import { TipoContatoController } from './tipo_contato.controller';
import { PrismaService } from 'src/database/prima.service';
import { TipoContatoRepository } from './repositories/tipo-contato-repository';
import { PrismaTipoContatoRepository } from './repositories/prisma/prisma-tipo-contato-repository';

@Module({
  controllers: [TipoContatoController],
  providers: [ PrismaService,
    {
      provide: TipoContatoRepository,
      useClass: PrismaTipoContatoRepository
    }]
})
export class TipoContatoModule {}
