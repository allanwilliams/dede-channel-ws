import { IsNotEmpty } from "class-validator";

export class CreateTipoContatoDto {
    @IsNotEmpty()
    id: string;

    @IsNotEmpty()
    nome: string;
}
