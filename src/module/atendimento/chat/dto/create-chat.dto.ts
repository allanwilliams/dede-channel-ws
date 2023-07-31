import { IsNotEmpty } from "class-validator";

export class CreateChatDto {
    id?: string;

    @IsNotEmpty()
    nome: string
}
