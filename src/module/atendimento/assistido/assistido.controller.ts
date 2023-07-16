import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { CreateAssistidoDto } from './dto/create-assistido.dto';
import { UpdateAssistidoDto } from './dto/update-assistido.dto';
import { AssistidoRepository } from './repositories/assistido-repository';

@Controller('atendimento/assistido')
export class AssistidoController {
  constructor(private assistidoRepository: AssistidoRepository) {}

  @Post()
  create(@Body() createAssistidoDto: CreateAssistidoDto) {
    return this.assistidoRepository.create(createAssistidoDto);
  }

  @Get()
  findAll() {
    return this.assistidoRepository.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.assistidoRepository.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateAssistidoDto: UpdateAssistidoDto) {
    return this.assistidoRepository.update(id, updateAssistidoDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.assistidoRepository.remove(id);
  }
}
