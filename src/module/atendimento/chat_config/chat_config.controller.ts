import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { CreateChatConfigDto } from './dto/create-chat_config.dto';
import { UpdateChatConfigDto } from './dto/update-chat_config.dto';
import { ChatConfigRepository } from './repositories/chat-config-repository';

@Controller('atendimento/chat-config')
export class ChatConfigController {
  constructor(private chatConfigRepository: ChatConfigRepository) {}

  @Post()
  create(@Body() createChatConfigDto: CreateChatConfigDto) {
    return this.chatConfigRepository.create(createChatConfigDto);
  }

  @Get()
  findAll() {
    return this.chatConfigRepository.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.chatConfigRepository.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateChatConfigDto: UpdateChatConfigDto) {
    return this.chatConfigRepository.update(id, updateChatConfigDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.chatConfigRepository.remove(id);
  }
}
