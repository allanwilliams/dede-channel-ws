import { Module } from '@nestjs/common';
import { AtendimentoService } from './atendimento.service';
import { AtendimentoController } from './atendimento.controller';
import { AssistidoModule } from './assistido/assistido.module';
import { ChatModule } from './chat/chat.module';
import { CanalModule } from './canal/canal.module';
import { MensagemModule } from './mensagem/mensagem.module';
import { StatusModule } from './status/status.module';
import { TipoContatoModule } from './tipo_contato/tipo_contato.module';
import { ChatConfigModule } from './chat_config/chat_config.module';
import { AnexoModule } from './anexo/anexo.module';

@Module({
  controllers: [AtendimentoController],
  providers: [AtendimentoService],
  imports: [AssistidoModule, ChatModule, CanalModule, MensagemModule, StatusModule, TipoContatoModule, ChatConfigModule, AnexoModule]
})
export class AtendimentoModule {}
