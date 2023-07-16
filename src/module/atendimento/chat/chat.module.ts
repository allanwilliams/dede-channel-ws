import { Module } from '@nestjs/common';
import { ChatService } from './chat.service';
import { ChatController } from './chat.controller';
import { ChatRepository } from './repositories/chat-repository';
import { PrismaChatRepository } from './repositories/prisma/prisma-chat-repository';
import { PrismaService } from 'src/database/prima.service';

@Module({
  controllers: [ChatController],
  providers: [
    PrismaService,
    {
      provide: ChatRepository,
      useClass: PrismaChatRepository
    }
  ]
})
export class ChatModule {}
