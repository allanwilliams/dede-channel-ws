import { IsNotEmpty } from "class-validator";
import { CreateAnexoDto } from "../../anexo/dto/create-anexo.dto";

export class CreateMensagemDto {
    id?: string;

    @IsNotEmpty()
    mensagem: string;

    @IsNotEmpty()
    ChatConfig: Object;

    @IsNotEmpty()
    Chat: Object;

    @IsNotEmpty()
    lida: boolean;

    @IsNotEmpty()
    from_assistido: boolean;

    @IsNotEmpty()
    ack: number;    
}