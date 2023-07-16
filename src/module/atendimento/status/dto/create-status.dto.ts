import { IsNotEmpty, isNotEmpty } from "class-validator";

export class CreateStatusDto {
    @IsNotEmpty()
    id: string;

    @IsNotEmpty()
    nome: string;
}
