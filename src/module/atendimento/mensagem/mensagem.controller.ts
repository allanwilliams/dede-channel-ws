import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { CreateMensagemDto } from './dto/create-mensagem.dto';
import { UpdateMensagemDto } from './dto/update-mensagem.dto';
import { MensagemRepository } from './repositories/mensagem-repository';

@Controller('atendimento/mensagem')
export class MensagemController {
  constructor(private mensagemRepository:MensagemRepository) {}

  @Post()
  create(@Body() createMensagemDto: CreateMensagemDto) {
    return this.mensagemRepository.create(createMensagemDto);
  }

  @Get()
  findAll() {
    return this.mensagemRepository.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.mensagemRepository.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateMensagemDto: UpdateMensagemDto) {
    return this.mensagemRepository.update(id, updateMensagemDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.mensagemRepository.remove(id);
  }
}
