import { PartialType } from '@nestjs/mapped-types';
import { CreateChatConfigDto } from './create-chat_config.dto';

export class UpdateChatConfigDto extends PartialType(CreateChatConfigDto) {}
