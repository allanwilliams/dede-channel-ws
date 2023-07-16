import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { ChatRepository } from './repositories/chat-repository';
import { CreateChatDto } from './dto/create-chat.dto';
import { UpdateChatDto } from './dto/update-chat.dto';

@Controller('atendimento/chat')
export class ChatController {
  constructor(private readonly chatRepository: ChatRepository) {}

  @Post()
  create(@Body() createChatDto: CreateChatDto) {
    return this.chatRepository.create(createChatDto);
  }

  @Get()
  findAll() {
    return this.chatRepository.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.chatRepository.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateChatDto: UpdateChatDto) {
    return this.chatRepository.update(id, updateChatDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.chatRepository.remove(id);
  }
}
