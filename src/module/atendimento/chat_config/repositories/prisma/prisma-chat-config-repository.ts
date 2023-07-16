import { randomUUID } from "node:crypto";
import { PrismaService } from "src/database/prima.service";
import { CreateChatConfigDto } from "../../dto/create-chat_config.dto"; 
import { UpdateChatConfigDto } from "../../dto/update-chat_config.dto";

import { Injectable } from "@nestjs/common";
import { ChatConfigRepository } from "../chat-config-repository";
import { GetResult } from "@prisma/client/runtime";

@Injectable()
export class PrismaChatConfigRepository implements ChatConfigRepository {
    constructor (private prisma: PrismaService) {}
    private includeObj = {
        
    }

    async create(createChatConfigDto:CreateChatConfigDto ) {
        return await this.prisma.chatConfig.create({
            data: {
                id: randomUUID(),
                ...createChatConfigDto
            },
            include: {
                canal: true
            }
        })
    }

    async findAll() {
        return await this.prisma.chatConfig.findMany({
        })
    }

    async findOne(id: string): Promise<any> {
        return await this.prisma.chatConfig.findUnique({
            where: {
                id
            },
        })
    }

    async update(id: string,updateChatConfigDto:UpdateChatConfigDto): Promise<any>{
        return await this.prisma.chatConfig.update({
            data:updateChatConfigDto,
            where: {
                id
            }
        })
    }
    
    async remove(id: string): Promise<any> {
        return await this.prisma.chatConfig.delete({
            where: {
                id
            }
        })
    }
}