import { Module } from '@nestjs/common';
import { ChatConfigController } from './chat_config.controller';
import { PrismaService } from 'src/database/prima.service';
import { ChatConfigRepository } from './repositories/chat-config-repository';
import { PrismaChatConfigRepository } from './repositories/prisma/prisma-chat-config-repository';

@Module({
  controllers: [ChatConfigController],
  providers: [PrismaService,
    {
      provide: ChatConfigRepository,
      useClass: PrismaChatConfigRepository
    }]
})
export class ChatConfigModule {}
