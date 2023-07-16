import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { PrismaService } from './database/prima.service';
import { ChatModule } from './module/atendimento/chat/chat.module';
import { AtendimentoModuleWS } from './module/atendimentoWS/atendimento.module';
import { AtendimentoModule } from './module/atendimento/atendimento.module';

@Module({
  imports: [AtendimentoModule, AtendimentoModuleWS],
  controllers: [AppController],
  providers: [PrismaService],
})
export class AppModule {}
