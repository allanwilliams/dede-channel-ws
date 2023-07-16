import { Test, TestingModule } from '@nestjs/testing';
import { AssistidoService } from './assistido.service';

describe('AssistidoService', () => {
  let service: AssistidoService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [AssistidoService],
    }).compile();

    service = module.get<AssistidoService>(AssistidoService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
