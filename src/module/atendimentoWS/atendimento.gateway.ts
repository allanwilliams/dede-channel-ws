import { WebSocketGateway, SubscribeMessage, MessageBody } from '@nestjs/websockets';
import { AtendimentoService } from './atendimento.service';
import { CreateAtendimentoDto } from './dto/create-atendimento.dto';
import { UpdateAtendimentoDto } from './dto/update-atendimento.dto';
import { AssistidoRepository } from '../atendimento/assistido/repositories/assistido-repository';
import { ChatRepository } from '../atendimento/chat/repositories/chat-repository';
import { CanalRepository } from '../atendimento/canal/repositories/canal-repository';
import { MensagemRepository } from '../atendimento/mensagem/repositories/mensagem-repository';
import { CreateMensagemDto } from '../atendimento/mensagem/dto/create-mensagem.dto';
import { StatusRepository } from '../atendimento/status/repositories/status-repository';
import { TipoContatoRepository } from '../atendimento/tipo_contato/repositories/tipo-contato-repository';

@WebSocketGateway({
  cors: {
    origin: '*',
  },
  namespace: 'atendimento'
})
export class AtendimentoGateway {
  constructor(
    private readonly atendimentoService: AtendimentoService,
    private assistidoRepository: AssistidoRepository,
    private chatRepository: ChatRepository,
    private canalRepository: CanalRepository,
    private mensagemRepository: MensagemRepository,
    private statusRepository: StatusRepository,
    private tipoContatoRepository: TipoContatoRepository,
  ) { }

  @SubscribeMessage('findAllAtendimento')
  findAll() {
    return this.assistidoRepository.findAll()
  }

  @SubscribeMessage('getAllChats')
  getAllChats() {
    return this.chatRepository.findAll();
  }

  @SubscribeMessage('getAllCanais')
  getAllCanais() {
    return this.canalRepository.findAll();
  }

  @SubscribeMessage('getAllStatus')
  getAllStatus() {
    return this.statusRepository.findAll();
  }

  @SubscribeMessage('getAllTipoContato')
  getAllTipoContato() {
    return this.tipoContatoRepository.findAll();
  }

  @SubscribeMessage('sendMessage')
  sendMessage(@MessageBody() createMensagemDto: CreateMensagemDto) {
    return this.mensagemRepository.create(createMensagemDto)
  }
}
