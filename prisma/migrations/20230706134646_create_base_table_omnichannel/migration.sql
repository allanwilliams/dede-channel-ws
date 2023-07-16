-- CreateTable
CREATE TABLE "ChatConfig" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME,
    "atualizado_em" DATETIME,
    "canal_id" TEXT NOT NULL,
    "chave_cliente_canal" TEXT NOT NULL,
    "chat_id" TEXT,
    CONSTRAINT "ChatConfig_canal_id_fkey" FOREIGN KEY ("canal_id") REFERENCES "Canal" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ChatConfig_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "Chat" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Chat" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME,
    "atualizado_em" DATETIME,
    "status_id" TEXT NOT NULL,
    "usuario_id" TEXT,
    "ultima_interacao_assistido" TEXT,
    "ultima_interacao_usuario" TEXT,
    "em_fila" BOOLEAN
);

-- CreateTable
CREATE TABLE "Mensagem" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME,
    "atualizado_em" DATETIME,
    "mensagem" TEXT NOT NULL,
    "chat_config_id" TEXT NOT NULL,
    "chat_id" TEXT NOT NULL,
    "canal_id" TEXT,
    "lida" BOOLEAN NOT NULL,
    "from_assistido" BOOLEAN NOT NULL,
    "from_bot" BOOLEAN,
    "usuario_id" TEXT,
    "data_hora" TEXT NOT NULL,
    "ack" INTEGER NOT NULL,
    "oculta" BOOLEAN,
    CONSTRAINT "Mensagem_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "Chat" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Canal" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Anexo" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME,
    "atualizado_em" DATETIME,
    "mensagem_id" TEXT NOT NULL,
    "file" TEXT NOT NULL,
    "tipo" INTEGER NOT NULL,
    "mensagemId" TEXT,
    CONSTRAINT "Anexo_mensagemId_fkey" FOREIGN KEY ("mensagemId") REFERENCES "Mensagem" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Status" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Historico" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME,
    "atualizado_em" DATETIME,
    "chat_id" TEXT NOT NULL,
    "usuario_id" TEXT NOT NULL,
    "status_id" TEXT NOT NULL,
    "finalizacao_id" TEXT NOT NULL,
    "anotacao" TEXT NOT NULL,
    "protocolo" TEXT NOT NULL,
    "chat_config_id" TEXT NOT NULL,
    "chatId" TEXT,
    CONSTRAINT "Historico_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES "Chat" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Finalizacao" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Usuario" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL,
    "cpf" TEXT,
    "matricula" TEXT
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Assistido" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL,
    "cpf" TEXT,
    "chat_id" TEXT,
    CONSTRAINT "Assistido_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "Chat" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Assistido" ("id", "nome") SELECT "id", "nome" FROM "Assistido";
DROP TABLE "Assistido";
ALTER TABLE "new_Assistido" RENAME TO "Assistido";
CREATE UNIQUE INDEX "Assistido_chat_id_key" ON "Assistido"("chat_id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
