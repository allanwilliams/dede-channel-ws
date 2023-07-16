import { IsNotEmpty, isNotEmpty } from "class-validator";

export class CreateAssistidoDto {
    id?: string;

    @IsNotEmpty()
    nome: string
}
