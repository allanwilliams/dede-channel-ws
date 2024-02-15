import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { CreateAnexoDto } from './dto/create-anexo.dto';
import { UpdateAnexoDto } from './dto/update-anexo.dto';
import { AnexoRepository } from './repositories/anexo-repository';

@Controller('anexo')
export class AnexoController {
  constructor(private anexoRepository:AnexoRepository) {}

  @Post()
  create(@Body() createAnexoDto: CreateAnexoDto) {
    return this.anexoRepository.create(createAnexoDto);
  }

  @Get()
  findAll() {
    return this.anexoRepository.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.anexoRepository.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateAnexoDto: UpdateAnexoDto) {
    return this.anexoRepository.update(id, updateAnexoDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.anexoRepository.remove(id);
  }
}
