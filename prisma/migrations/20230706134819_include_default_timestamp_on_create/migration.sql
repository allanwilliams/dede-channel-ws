-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Historico" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
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
INSERT INTO "new_Historico" ("anotacao", "atualizado_em", "chatId", "chat_config_id", "chat_id", "criado_em", "finalizacao_id", "id", "protocolo", "status_id", "usuario_id") SELECT "anotacao", "atualizado_em", "chatId", "chat_config_id", "chat_id", "criado_em", "finalizacao_id", "id", "protocolo", "status_id", "usuario_id" FROM "Historico";
DROP TABLE "Historico";
ALTER TABLE "new_Historico" RENAME TO "Historico";
CREATE TABLE "new_Anexo" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "mensagem_id" TEXT NOT NULL,
    "file" TEXT NOT NULL,
    "tipo" INTEGER NOT NULL,
    "mensagemId" TEXT,
    CONSTRAINT "Anexo_mensagemId_fkey" FOREIGN KEY ("mensagemId") REFERENCES "Mensagem" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Anexo" ("atualizado_em", "criado_em", "file", "id", "mensagemId", "mensagem_id", "tipo") SELECT "atualizado_em", "criado_em", "file", "id", "mensagemId", "mensagem_id", "tipo" FROM "Anexo";
DROP TABLE "Anexo";
ALTER TABLE "new_Anexo" RENAME TO "Anexo";
CREATE TABLE "new_Assistido" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL,
    "cpf" TEXT,
    "chat_id" TEXT,
    CONSTRAINT "Assistido_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "Chat" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Assistido" ("atualizado_em", "chat_id", "cpf", "criado_em", "id", "nome") SELECT "atualizado_em", "chat_id", "cpf", "criado_em", "id", "nome" FROM "Assistido";
DROP TABLE "Assistido";
ALTER TABLE "new_Assistido" RENAME TO "Assistido";
CREATE UNIQUE INDEX "Assistido_chat_id_key" ON "Assistido"("chat_id");
CREATE TABLE "new_ChatConfig" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "canal_id" TEXT NOT NULL,
    "chave_cliente_canal" TEXT NOT NULL,
    "chat_id" TEXT,
    CONSTRAINT "ChatConfig_canal_id_fkey" FOREIGN KEY ("canal_id") REFERENCES "Canal" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ChatConfig_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "Chat" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_ChatConfig" ("atualizado_em", "canal_id", "chat_id", "chave_cliente_canal", "criado_em", "id") SELECT "atualizado_em", "canal_id", "chat_id", "chave_cliente_canal", "criado_em", "id" FROM "ChatConfig";
DROP TABLE "ChatConfig";
ALTER TABLE "new_ChatConfig" RENAME TO "ChatConfig";
CREATE TABLE "new_Finalizacao" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL
);
INSERT INTO "new_Finalizacao" ("atualizado_em", "criado_em", "id", "nome") SELECT "atualizado_em", "criado_em", "id", "nome" FROM "Finalizacao";
DROP TABLE "Finalizacao";
ALTER TABLE "new_Finalizacao" RENAME TO "Finalizacao";
CREATE TABLE "new_Mensagem" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
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
INSERT INTO "new_Mensagem" ("ack", "atualizado_em", "canal_id", "chat_config_id", "chat_id", "criado_em", "data_hora", "from_assistido", "from_bot", "id", "lida", "mensagem", "oculta", "usuario_id") SELECT "ack", "atualizado_em", "canal_id", "chat_config_id", "chat_id", "criado_em", "data_hora", "from_assistido", "from_bot", "id", "lida", "mensagem", "oculta", "usuario_id" FROM "Mensagem";
DROP TABLE "Mensagem";
ALTER TABLE "new_Mensagem" RENAME TO "Mensagem";
CREATE TABLE "new_Usuario" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL,
    "cpf" TEXT,
    "matricula" TEXT
);
INSERT INTO "new_Usuario" ("atualizado_em", "cpf", "criado_em", "id", "matricula", "nome") SELECT "atualizado_em", "cpf", "criado_em", "id", "matricula", "nome" FROM "Usuario";
DROP TABLE "Usuario";
ALTER TABLE "new_Usuario" RENAME TO "Usuario";
CREATE TABLE "new_Status" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL
);
INSERT INTO "new_Status" ("atualizado_em", "criado_em", "id", "nome") SELECT "atualizado_em", "criado_em", "id", "nome" FROM "Status";
DROP TABLE "Status";
ALTER TABLE "new_Status" RENAME TO "Status";
CREATE TABLE "new_Chat" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "status_id" TEXT NOT NULL,
    "usuario_id" TEXT,
    "ultima_interacao_assistido" TEXT,
    "ultima_interacao_usuario" TEXT,
    "em_fila" BOOLEAN
);
INSERT INTO "new_Chat" ("atualizado_em", "criado_em", "em_fila", "id", "status_id", "ultima_interacao_assistido", "ultima_interacao_usuario", "usuario_id") SELECT "atualizado_em", "criado_em", "em_fila", "id", "status_id", "ultima_interacao_assistido", "ultima_interacao_usuario", "usuario_id" FROM "Chat";
DROP TABLE "Chat";
ALTER TABLE "new_Chat" RENAME TO "Chat";
CREATE TABLE "new_Canal" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL
);
INSERT INTO "new_Canal" ("atualizado_em", "criado_em", "id", "nome") SELECT "atualizado_em", "criado_em", "id", "nome" FROM "Canal";
DROP TABLE "Canal";
ALTER TABLE "new_Canal" RENAME TO "Canal";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
