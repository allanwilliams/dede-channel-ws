import { IsNotEmpty } from "class-validator";

export class CreateAnexoDto {
    id?: string;

    file: string
    
    mensagemId: string

    tipo: number

}
