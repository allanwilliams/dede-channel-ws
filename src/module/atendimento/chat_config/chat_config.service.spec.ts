import { Test, TestingModule } from '@nestjs/testing';
import { ChatConfigService } from './chat_config.service';

describe('ChatConfigService', () => {
  let service: ChatConfigService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ChatConfigService],
    }).compile();

    service = module.get<ChatConfigService>(ChatConfigService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
