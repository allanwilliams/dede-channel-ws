import { Test, TestingModule } from '@nestjs/testing';
import { TipoContatoService } from './tipo_contato.service';

describe('TipoContatoService', () => {
  let service: TipoContatoService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [TipoContatoService],
    }).compile();

    service = module.get<TipoContatoService>(TipoContatoService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
