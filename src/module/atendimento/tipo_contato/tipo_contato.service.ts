import { Injectable } from '@nestjs/common';
import { CreateTipoContatoDto } from './dto/create-tipo_contato.dto';
import { UpdateTipoContatoDto } from './dto/update-tipo_contato.dto';

@Injectable()
export class TipoContatoService {
  create(createTipoContatoDto: CreateTipoContatoDto) {
    return 'This action adds a new tipoContato';
  }

  findAll() {
    return `This action returns all tipoContato`;
  }

  findOne(id: number) {
    return `This action returns a #${id} tipoContato`;
  }

  update(id: number, updateTipoContatoDto: UpdateTipoContatoDto) {
    return `This action updates a #${id} tipoContato`;
  }

  remove(id: number) {
    return `This action removes a #${id} tipoContato`;
  }
}
