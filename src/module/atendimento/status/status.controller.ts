import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { CreateStatusDto } from './dto/create-status.dto';
import { UpdateStatusDto } from './dto/update-status.dto';
import { StatusRepository } from './repositories/status-repository';

@Controller('atendimento/status')
export class StatusController {
  constructor(private statusRepository: StatusRepository) {}

  @Post()
  create(@Body() createStatusDto: CreateStatusDto) {
    return this.statusRepository.create(createStatusDto);
  }

  @Get()
  findAll() {
    return this.statusRepository.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.statusRepository.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateStatusDto: UpdateStatusDto) {
    return this.statusRepository.update(id, updateStatusDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.statusRepository.remove(id);
  }
}
