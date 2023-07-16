import { CreateCanalDto } from "../dto/create-canal.dto"

export abstract class CanalRepository {
    abstract create(createCanalDto: CreateCanalDto): Promise<any>
    abstract findAll(): Promise<any>
    abstract findOne(id: string): Promise<any>
    abstract update(id: string, updateCanalDto: any): Promise<any>
    abstract remove(id: string): Promise<any>
}