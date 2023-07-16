import { randomUUID } from "node:crypto";
import { PrismaService } from "src/database/prima.service";
import { CreateAssistidoDto } from "../../dto/create-assistido.dto";
import { UpdateAssistidoDto } from "../../dto/update-assistido.dto";
import { AssistidoRepository } from "../assistido-repository";
import { Injectable } from "@nestjs/common";

@Injectable()
export class PrismaAssistidoRepository implements AssistidoRepository {
    constructor (private prisma: PrismaService) {}

    private includeObj = {
        Chat: {
            include: {
                ChatConfig: {
                    include: {
                        canal: true
                    }
                }
            }
        }
    }
    
    async create(createAssistidoDto: CreateAssistidoDto ): Promise<void> {
        await this.prisma.assistido.create({
            data: {
                id: randomUUID(),
                ...createAssistidoDto
            }
        })
    }

    async findAll() {
        return await this.prisma.assistido.findMany({
            include: { ...this.includeObj }
        })
    }

    async findOne(id: string): Promise<any> {
        return await this.prisma.assistido.findUnique({
            where: {
                id
            },
            include: { ...this.includeObj }
        })
    }

    async update(id: string, updateAssistidoDto: UpdateAssistidoDto): Promise<any>{
        return await this.prisma.assistido.update({
            data: updateAssistidoDto,
            where: {
                id
            }
        })
    }
    
    async remove(id: string): Promise<any> {
        return await this.prisma.assistido.delete({
            where: {
                id
            }
        })
    }
}