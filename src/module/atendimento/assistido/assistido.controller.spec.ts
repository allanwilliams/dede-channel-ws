import { Test, TestingModule } from '@nestjs/testing';
import { AssistidoController } from './assistido.controller';
import { AssistidoService } from './assistido.service';

describe('AssistidoController', () => {
  let controller: AssistidoController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [AssistidoController],
      providers: [AssistidoService],
    }).compile();

    controller = module.get<AssistidoController>(AssistidoController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
