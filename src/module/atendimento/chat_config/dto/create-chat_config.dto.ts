import { IsNotEmpty } from "class-validator";

export class CreateChatConfigDto {
    @IsNotEmpty()
    canal_id: string;

    @IsNotEmpty()
    chave_cliente_canal: string;

    @IsNotEmpty()
    chat_id: string;

    @IsNotEmpty()
    tipo_contato_id: string;
}
