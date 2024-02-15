import { randomUUID } from "node:crypto";
import { PrismaService } from "src/database/prima.service";
import { CreateMensagemDto } from "../../dto/create-mensagem.dto"; 
import { UpdateMensagemDto } from "../../dto/update-mensagem.dto";
import { MensagemRepository } from "../mensagem-repository";
import { Injectable } from "@nestjs/common";

@Injectable()
export class PrismaMensagemRepository implements MensagemRepository {
    constructor (private prisma: PrismaService) {}
    private includeObj = {
        
    }

    async create(createMensagemDto:CreateMensagemDto ): Promise<void> {
        await this.prisma.mensagem.create({
            data: {
                id: randomUUID(),
                ...createMensagemDto
            },include:{
                anexo: true
            }
        })
    }

    async findAll() {
        return await this.prisma.mensagem.findMany({
        })
    }

    async findOne(id: string): Promise<any> {
        return await this.prisma.mensagem.findUnique({
            where: {
                id
            },
        })
    }

    async update(id: string,updateMensagemDto:UpdateMensagemDto): Promise<any>{
        return await this.prisma.mensagem.update({
            data:updateMensagemDto,
            where: {
                id
            }
        })
    }
    
    async remove(id: string): Promise<any> {
        return await this.prisma.mensagem.delete({
            where: {
                id
            }
        })
    }
}