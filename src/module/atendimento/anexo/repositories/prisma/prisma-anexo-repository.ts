import { randomUUID } from "node:crypto";
import { PrismaService } from "src/database/prima.service";
import { CreateAnexoDto } from "../../dto/create-anexo.dto";
import { UpdateAnexoDto } from "../../dto/update-anexo.dto";
import { AnexoRepository } from "../anexo-repository";
import { Injectable } from "@nestjs/common";

@Injectable()
export class PrismaAnexoRepository implements AnexoRepository {
    constructor (private prisma: PrismaService) {}
    private includeObj = {
        
    }

    async create(createAnexoDto:CreateAnexoDto ): Promise<void> {
        await this.prisma.anexo.create({
            data: {
                id: randomUUID(),
                ...createAnexoDto
            }
        })
    }

    async findAll() {
        return await this.prisma.anexo.findMany({
        })
    }

    async findOne(id: string): Promise<any> {
        return await this.prisma.anexo.findUnique({
            where: {
                id
            },
        })
    }

    async update(id: string,updateAnexoDto:UpdateAnexoDto): Promise<any>{
        return await this.prisma.mensagem.update({
            data:updateAnexoDto,
            where: {
                id
            }
        })
    }
    
    async remove(id: string): Promise<any> {
        return await this.prisma.anexo.delete({
            where: {
                id
            }
        })
    }
}