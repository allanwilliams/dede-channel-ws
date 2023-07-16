import { CreateMensagemDto } from "../dto/create-mensagem.dto";

export abstract class MensagemRepository {
    abstract create(createMensagemDto: CreateMensagemDto): Promise<any>
    abstract findAll(): Promise<any>
    abstract findOne(id: string): Promise<any>
    abstract update(id: string, updateChatDto: any): Promise<any>
    abstract remove(id: string): Promise<any>
}