import { CreateTipoContatoDto } from "../dto/create-tipo_contato.dto";

export abstract class TipoContatoRepository {
    abstract create(createTipoContatoDto: CreateTipoContatoDto): Promise<any>
    abstract findAll(): Promise<any>
    abstract findOne(id: string): Promise<any>
    abstract update(id: string, UpdateStatusDto: any): Promise<any>
    abstract remove(id: string): Promise<any>
}