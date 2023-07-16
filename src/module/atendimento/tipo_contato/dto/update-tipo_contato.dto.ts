import { PartialType } from '@nestjs/mapped-types';
import { CreateTipoContatoDto } from './create-tipo_contato.dto';

export class UpdateTipoContatoDto extends PartialType(CreateTipoContatoDto) {}
