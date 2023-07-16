import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { CreateTipoContatoDto } from './dto/create-tipo_contato.dto';
import { UpdateTipoContatoDto } from './dto/update-tipo_contato.dto';
import { TipoContatoRepository } from './repositories/tipo-contato-repository';

@Controller('atendimento/tipo-contato')
export class TipoContatoController {
  constructor(private tipoContatoRepository: TipoContatoRepository) {}

  @Post()
  create(@Body() createTipoContatoDto: CreateTipoContatoDto) {
    return this.tipoContatoRepository.create(createTipoContatoDto);
  }

  @Get()
  findAll() {
    return this.tipoContatoRepository.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.tipoContatoRepository.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateTipoContatoDto: UpdateTipoContatoDto) {
    return this.tipoContatoRepository.update(id, updateTipoContatoDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.tipoContatoRepository.remove(id);
  }
}
