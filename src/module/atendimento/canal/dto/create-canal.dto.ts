import { IsNotEmpty } from "class-validator";

export class CreateCanalDto {
    id: string;

    @IsNotEmpty()
    nome: string;
}
