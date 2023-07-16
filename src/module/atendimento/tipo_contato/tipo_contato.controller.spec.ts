import { Test, TestingModule } from '@nestjs/testing';
import { TipoContatoController } from './tipo_contato.controller';
import { TipoContatoService } from './tipo_contato.service';

describe('TipoContatoController', () => {
  let controller: TipoContatoController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [TipoContatoController],
      providers: [TipoContatoService],
    }).compile();

    controller = module.get<TipoContatoController>(TipoContatoController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
