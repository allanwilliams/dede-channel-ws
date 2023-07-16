import { IsNotEmpty } from "class-validator";

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
