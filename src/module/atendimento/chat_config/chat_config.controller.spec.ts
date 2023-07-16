import { Test, TestingModule } from '@nestjs/testing';
import { ChatConfigController } from './chat_config.controller';
import { ChatConfigService } from './chat_config.service';

describe('ChatConfigController', () => {
  let controller: ChatConfigController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ChatConfigController],
      providers: [ChatConfigService],
    }).compile();

    controller = module.get<ChatConfigController>(ChatConfigController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
