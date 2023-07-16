import { CreateStatusDto } from "../dto/create-status.dto";

export abstract class StatusRepository {
    abstract create(createStatusDto: CreateStatusDto): Promise<any>
    abstract findAll(): Promise<any>
    abstract findOne(id: string): Promise<any>
    abstract update(id: string, UpdateStatusDto: any): Promise<any>
    abstract remove(id: string): Promise<any>
}