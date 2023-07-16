import { Controller } from '@nestjs/common';
import { AtendimentoService } from './atendimento.service';

@Controller('atendimento')
export class AtendimentoController {
  constructor(private readonly atendimentoService: AtendimentoService) {}

}
