import { Module } from '@nestjs/common';
import { AtendimentoService } from './atendimento.service';
import { AtendimentoGateway } from './atendimento.gateway';
import { PrismaService } from 'src/database/prima.service';
import { AssistidoRepository } from '../atendimento/assistido/repositories/assistido-repository';
import { PrismaAssistidoRepository } from '../atendimento/assistido/repositories/prisma/prisma-assistido-repository';
import { ChatRepository } from '../atendimento/chat/repositories/chat-repository';
import { PrismaChatRepository } from '../atendimento/chat/repositories/prisma/prisma-chat-repository';
import { PrismaCanalRepository } from '../atendimento/canal/repositories/prisma/prisma-canal-repository';
import { CanalRepository } from '../atendimento/canal/repositories/canal-repository';
import { MensagemRepository } from '../atendimento/mensagem/repositories/mensagem-repository';
import { PrismaMensagemRepository } from '../atendimento/mensagem/repositories/prisma/prisma-mensagem-repository';
import { StatusRepository } from '../atendimento/status/repositories/status-repository';
import { PrismaStatusRepository } from '../atendimento/status/repositories/prisma/prisma-status-repository';
import { TipoContatoRepository } from '../atendimento/tipo_contato/repositories/tipo-contato-repository';
import { PrismaTipoContatoRepository } from '../atendimento/tipo_contato/repositories/prisma/prisma-tipo-contato-repository';
import { AnexoRepository } from '../atendimento/anexo/repositories/anexo-repository';
import { PrismaAnexoRepository } from '../atendimento/anexo/repositories/prisma/prisma-anexo-repository';

@Module({
  providers: [
    AtendimentoGateway,
    AtendimentoService,
    PrismaService,
    {
      provide: AssistidoRepository,
      useClass: PrismaAssistidoRepository
    },
    {
      provide: ChatRepository,
      useClass: PrismaChatRepository
    },
    {
      provide: CanalRepository,
      useClass: PrismaCanalRepository
    },
    {
      provide: MensagemRepository,
      useClass: PrismaMensagemRepository
    },
    {
      provide: AnexoRepository,
      useClass: PrismaAnexoRepository
    },
    {
      provide: StatusRepository,
      useClass: PrismaStatusRepository
    },
    {
      provide: TipoContatoRepository,
      useClass: PrismaTipoContatoRepository
    },
  ]
})
export class AtendimentoModuleWS { }
