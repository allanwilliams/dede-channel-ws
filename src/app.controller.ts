import { Body, Controller, Get, Post } from '@nestjs/common';
import { PrismaService } from './database/prima.service';
import { randomUUID } from 'crypto';

@Controller()
export class AppController {
  constructor(
    private prisma: PrismaService
  ) {}

  @Get()
  async findAll(){
    const assistidos = await this.prisma.assistido.findMany()
    return assistidos
  }

  @Post()
  async create(@Body() data: any){
    const { nome } = data
    const assistido = await this.prisma.assistido.create(
      {
        data: {
          id: randomUUID(),
          nome: nome
        }
      }
    )
    return assistido
  }
}
