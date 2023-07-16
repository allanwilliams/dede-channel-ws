import { Injectable } from '@nestjs/common';
import { CreateChatConfigDto } from './dto/create-chat_config.dto';
import { UpdateChatConfigDto } from './dto/update-chat_config.dto';

@Injectable()
export class ChatConfigService {
  create(createChatConfigDto: CreateChatConfigDto) {
    return 'This action adds a new chatConfig';
  }

  findAll() {
    return `This action returns all chatConfig`;
  }

  findOne(id: number) {
    return `This action returns a #${id} chatConfig`;
  }

  update(id: number, updateChatConfigDto: UpdateChatConfigDto) {
    return `This action updates a #${id} chatConfig`;
  }

  remove(id: number) {
    return `This action removes a #${id} chatConfig`;
  }
}
