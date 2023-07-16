import { CreateAssistidoDto } from "../dto/create-assistido.dto"

export abstract class AssistidoRepository {
    abstract create(createAssistidoDto: CreateAssistidoDto): Promise<any>
    abstract findAll(): Promise<any>
    abstract findOne(id: string): Promise<any>
    abstract update(id: string, updateAssistidoDto: any): Promise<any>
    abstract remove(id: string): Promise<any>
}