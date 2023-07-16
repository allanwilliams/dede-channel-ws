import { randomUUID } from 'node:crypto';
import { Injectable } from '@nestjs/common';
import { CreateAssistidoDto } from './dto/create-assistido.dto';
import { UpdateAssistidoDto } from './dto/update-assistido.dto';
import { PrismaService } from 'src/database/prima.service';

@Injectable()
export class AssistidoService {
  constructor( private prisma: PrismaService ) {}

  create(createAssistidoDto: CreateAssistidoDto) {
    return this.prisma.assistido.create({
      data : {
        id: randomUUID(),
        ...createAssistidoDto
      }
    })
  }

  findAll() {
    return this.prisma.assistido.findMany()
  }

  findOne(id: number) {
    return `This action returns a #${id} assistido`;
  }

  update(id: number, updateAssistidoDto: UpdateAssistidoDto) {
    return `This action updates a #${id} assistido`;
  }

  remove(id: number) {
    return `This action removes a #${id} assistido`;
  }
}
