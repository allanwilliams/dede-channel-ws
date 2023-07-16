import { randomUUID } from "node:crypto";
import { PrismaService } from "src/database/prima.service";
import { CanalRepository } from "../canal-repository";
import { Injectable } from "@nestjs/common";
import { UpdateCanalDto } from "../../dto/update-canal.dto";
import { CreateCanalDto } from "../../dto/create-canal.dto";

@Injectable()
export class PrismaCanalRepository implements CanalRepository {
    constructor (private prisma: PrismaService) {}

    async create(createCanalDto: CreateCanalDto ): Promise<void> {
        await this.prisma.canal.create({
            data: {
                id: randomUUID(),
                ...createCanalDto
            }
        })
    }

    async findAll() {
        return await this.prisma.canal.findMany()
    }

    async findOne(id: string): Promise<any> {
        return await this.prisma.canal.findUnique({
            where: {
                id
            }
        })
    }

    async update(id: string, updatecanalDto: UpdateCanalDto): Promise<any>{
        return await this.prisma.canal.update({
            data: updatecanalDto,
            where: {
                id
            }
        })
    }
    
    async remove(id: string): Promise<any> {
        return await this.prisma.canal.delete({
            where: {
                id
            }
        })
    }
}