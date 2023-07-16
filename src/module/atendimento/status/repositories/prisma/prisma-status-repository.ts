import { randomUUID } from "node:crypto";
import { PrismaService } from "src/database/prima.service";
import { CreateStatusDto } from "../../dto/create-status.dto"; 
import { UpdateStatusDto } from "../../dto/update-status.dto";
import { Injectable } from "@nestjs/common";
import { StatusRepository } from "../status-repository";

@Injectable()
export class PrismaStatusRepository implements StatusRepository {
    constructor (private prisma: PrismaService) {}
    private includeObj = {
        
    }

    async create(createStatusDto:CreateStatusDto ): Promise<void> {
        await this.prisma.status.create({
            data: {
                id: randomUUID(),
                ...createStatusDto
            }
        })
    }

    async findAll() {
        return await this.prisma.status.findMany({
        })
    }

    async findOne(id: string): Promise<any> {
        return await this.prisma.status.findUnique({
            where: {
                id
            },
        })
    }

    async update(id: string,updateStatusDto:UpdateStatusDto): Promise<any>{
        return await this.prisma.status.update({
            data:updateStatusDto,
            where: {
                id
            }
        })
    }
    
    async remove(id: string): Promise<any> {
        return await this.prisma.status.delete({
            where: {
                id
            }
        })
    }
}