import { randomUUID } from "node:crypto";
import { PrismaService } from "src/database/prima.service";
import { CreateTipoContatoDto } from "../../dto/create-tipo_contato.dto"; 
import { UpdateTipoContatoDto } from "../../dto/update-tipo_contato.dto";
import { Injectable } from "@nestjs/common";
import { TipoContatoRepository } from "../tipo-contato-repository";

@Injectable()
export class PrismaTipoContatoRepository implements TipoContatoRepository {
    constructor (private prisma: PrismaService) {}
    private includeObj = {
        
    }

    async create(createTipoContatoDto:CreateTipoContatoDto ): Promise<void> {
        await this.prisma.tipoContato.create({
            data: {
                id: randomUUID(),
                ...createTipoContatoDto
            }
        })
    }

    async findAll() {
        return await this.prisma.tipoContato.findMany({
        })
    }

    async findOne(id: string): Promise<any> {
        return await this.prisma.tipoContato.findUnique({
            where: {
                id
            },
        })
    }

    async update(id: string,updateTipoContatoDto:UpdateTipoContatoDto): Promise<any>{
        return await this.prisma.tipoContato.update({
            data:updateTipoContatoDto,
            where: {
                id
            }
        })
    }
    
    async remove(id: string): Promise<any> {
        return await this.prisma.tipoContato.delete({
            where: {
                id
            }
        })
    }
}