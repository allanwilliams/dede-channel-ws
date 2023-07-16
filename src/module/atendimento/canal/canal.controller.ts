import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { CreateCanalDto } from './dto/create-canal.dto';
import { UpdateCanalDto } from './dto/update-canal.dto';
import { CanalRepository } from './repositories/canal-repository';

@Controller('atendimento/canal')
export class CanalController {
  constructor(private canalRepository:CanalRepository) {}

  @Post()
  create(@Body() createCanalDto: CreateCanalDto) {
    return this.canalRepository.create(createCanalDto);
  }

  @Get()
  findAll() {
    return this.canalRepository.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.canalRepository.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateCanalDto: UpdateCanalDto) {
    return this.canalRepository.update(id, updateCanalDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.canalRepository.remove(id);
  }
}
