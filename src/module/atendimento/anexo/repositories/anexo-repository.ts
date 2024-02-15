import { CreateAnexoDto } from "../dto/create-anexo.dto";

export abstract class AnexoRepository {
    abstract create(createAnexoDto: CreateAnexoDto): Promise<any>
    abstract findAll(): Promise<any>
    abstract findOne(id: string): Promise<any>
    abstract update(id: string, updateAnexoDto: any): Promise<any>
    abstract remove(id: string): Promise<any>
}