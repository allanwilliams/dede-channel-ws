import { CreateChatConfigDto } from "../dto/create-chat_config.dto";

export abstract class ChatConfigRepository {
    abstract create(createChatConfigDto: CreateChatConfigDto): Promise<any>
    abstract findAll(): Promise<any>
    abstract findOne(id: string): Promise<any>
    abstract update(id: string, updateChatConfig: any): Promise<any>
    abstract remove(id: string): Promise<any>
}