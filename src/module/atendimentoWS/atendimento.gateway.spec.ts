import { Test, TestingModule } from '@nestjs/testing';
import { AtendimentoGateway } from './atendimento.gateway';
import { AtendimentoService } from './atendimento.service';

describe('AtendimentoGateway', () => {
  let gateway: AtendimentoGateway;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [AtendimentoGateway, AtendimentoService],
    }).compile();

    gateway = module.get<AtendimentoGateway>(AtendimentoGateway);
  });

  it('should be defined', () => {
    expect(gateway).toBeDefined();
  });
});
