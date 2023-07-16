import { CreateChatDto } from "../dto/create-chat.dto";

export abstract class ChatRepository {
    abstract create(createChatDto: CreateChatDto): Promise<any>
    abstract findAll(): Promise<any>
    abstract findOne(id: string): Promise<any>
    abstract update(id: string, updateChatDto: any): Promise<any>
    abstract remove(id: string): Promise<any>
}