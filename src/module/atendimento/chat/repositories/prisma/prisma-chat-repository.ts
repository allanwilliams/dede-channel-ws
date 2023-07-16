import { randomUUID } from "node:crypto";
import { PrismaService } from "src/database/prima.service";
import { CreateChatDto } from "../../dto/create-chat.dto"; 
import { UpdateChatDto } from "../../dto/update-chat.dto";
import { ChatRepository } from "../chat-repository";
import { Injectable } from "@nestjs/common";

@Injectable()
export class PrismaChatRepository implements ChatRepository {
    constructor (private prisma: PrismaService) {}
    private includeObj = {
        ChatConfig: {
            include: {
                canal: true
            }
        },
        Assistido: true,
        Mensagem: true,
        Historico: true
    }

    async create(createChatDto:CreateChatDto ): Promise<void> {
        await this.prisma.chat.create({
            data: {
                id: randomUUID(),
                ...createChatDto
            }
        })
    }

    async findAll() {
        return await this.prisma.chat.findMany({
            include:{ ...this.includeObj }
        })
    }

    async findOne(id: string): Promise<any> {
        return await this.prisma.chat.findUnique({
            where: {
                id
            },
            include:{ ...this.includeObj }
        })
    }

    async update(id: string,updateChatDto:UpdateChatDto): Promise<any>{
        return await this.prisma.chat.update({
            data:updateChatDto,
            where: {
                id
            }
        })
    }
    
    async remove(id: string): Promise<any> {
        return await this.prisma.chat.delete({
            where: {
                id
            }
        })
    }
}