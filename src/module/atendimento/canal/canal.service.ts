import { Injectable } from '@nestjs/common';
import { CreateCanalDto } from './dto/create-canal.dto';
import { UpdateCanalDto } from './dto/update-canal.dto';

@Injectable()
export class CanalService {
  create(createCanalDto: CreateCanalDto) {
    return 'This action adds a new canal';
  }

  findAll() {
    return `This action returns all canal`;
  }

  findOne(id: number) {
    return `This action returns a #${id} canal`;
  }

  update(id: number, updateCanalDto: UpdateCanalDto) {
    return `This action updates a #${id} canal`;
  }

  remove(id: number) {
    return `This action removes a #${id} canal`;
  }
}
