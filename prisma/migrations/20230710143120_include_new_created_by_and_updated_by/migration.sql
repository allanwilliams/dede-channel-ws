-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Anexo" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "mensagem_id" TEXT NOT NULL,
    "file" TEXT NOT NULL,
    "tipo" INTEGER NOT NULL,
    "mensagemId" TEXT,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Anexo_mensagemId_fkey" FOREIGN KEY ("mensagemId") REFERENCES "Mensagem" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Anexo_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Anexo_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Anexo" ("atualizado_em", "criado_em", "file", "id", "mensagemId", "mensagem_id", "tipo") SELECT "atualizado_em", "criado_em", "file", "id", "mensagemId", "mensagem_id", "tipo" FROM "Anexo";
DROP TABLE "Anexo";
ALTER TABLE "new_Anexo" RENAME TO "Anexo";
CREATE UNIQUE INDEX "Anexo_criado_por_id_key" ON "Anexo"("criado_por_id");
CREATE UNIQUE INDEX "Anexo_modificado_por_id_key" ON "Anexo"("modificado_por_id");
CREATE TABLE "new_Assistido" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL,
    "cpf" TEXT,
    "chat_id" TEXT,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Assistido_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "Chat" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Assistido_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Assistido_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Assistido" ("atualizado_em", "chat_id", "cpf", "criado_em", "id", "nome") SELECT "atualizado_em", "chat_id", "cpf", "criado_em", "id", "nome" FROM "Assistido";
DROP TABLE "Assistido";
ALTER TABLE "new_Assistido" RENAME TO "Assistido";
CREATE UNIQUE INDEX "Assistido_chat_id_key" ON "Assistido"("chat_id");
CREATE UNIQUE INDEX "Assistido_criado_por_id_key" ON "Assistido"("criado_por_id");
CREATE UNIQUE INDEX "Assistido_modificado_por_id_key" ON "Assistido"("modificado_por_id");
CREATE TABLE "new_Mensagem" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "mensagem" TEXT NOT NULL,
    "chat_config_id" TEXT NOT NULL,
    "chat_id" TEXT NOT NULL,
    "lida" BOOLEAN NOT NULL,
    "from_assistido" BOOLEAN NOT NULL,
    "from_bot" BOOLEAN,
    "usuario_id" TEXT,
    "data_hora" TEXT NOT NULL,
    "ack" INTEGER NOT NULL,
    "oculta" BOOLEAN,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Mensagem_chat_config_id_fkey" FOREIGN KEY ("chat_config_id") REFERENCES "ChatConfig" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Mensagem_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "Chat" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Mensagem_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Mensagem_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Mensagem" ("ack", "atualizado_em", "chat_config_id", "chat_id", "criado_em", "data_hora", "from_assistido", "from_bot", "id", "lida", "mensagem", "oculta", "usuario_id") SELECT "ack", "atualizado_em", "chat_config_id", "chat_id", "criado_em", "data_hora", "from_assistido", "from_bot", "id", "lida", "mensagem", "oculta", "usuario_id" FROM "Mensagem";
DROP TABLE "Mensagem";
ALTER TABLE "new_Mensagem" RENAME TO "Mensagem";
CREATE UNIQUE INDEX "Mensagem_criado_por_id_key" ON "Mensagem"("criado_por_id");
CREATE UNIQUE INDEX "Mensagem_modificado_por_id_key" ON "Mensagem"("modificado_por_id");
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
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Historico_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES "Chat" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Historico_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Historico_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Historico" ("anotacao", "atualizado_em", "chatId", "chat_config_id", "chat_id", "criado_em", "finalizacao_id", "id", "protocolo", "status_id", "usuario_id") SELECT "anotacao", "atualizado_em", "chatId", "chat_config_id", "chat_id", "criado_em", "finalizacao_id", "id", "protocolo", "status_id", "usuario_id" FROM "Historico";
DROP TABLE "Historico";
ALTER TABLE "new_Historico" RENAME TO "Historico";
CREATE UNIQUE INDEX "Historico_criado_por_id_key" ON "Historico"("criado_por_id");
CREATE UNIQUE INDEX "Historico_modificado_por_id_key" ON "Historico"("modificado_por_id");
CREATE TABLE "new_Finalizacao" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Finalizacao_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Finalizacao_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Finalizacao" ("atualizado_em", "criado_em", "id", "nome") SELECT "atualizado_em", "criado_em", "id", "nome" FROM "Finalizacao";
DROP TABLE "Finalizacao";
ALTER TABLE "new_Finalizacao" RENAME TO "Finalizacao";
CREATE UNIQUE INDEX "Finalizacao_criado_por_id_key" ON "Finalizacao"("criado_por_id");
CREATE UNIQUE INDEX "Finalizacao_modificado_por_id_key" ON "Finalizacao"("modificado_por_id");
CREATE TABLE "new_Status" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Status_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Status_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Status" ("atualizado_em", "criado_em", "id", "nome") SELECT "atualizado_em", "criado_em", "id", "nome" FROM "Status";
DROP TABLE "Status";
ALTER TABLE "new_Status" RENAME TO "Status";
CREATE UNIQUE INDEX "Status_criado_por_id_key" ON "Status"("criado_por_id");
CREATE UNIQUE INDEX "Status_modificado_por_id_key" ON "Status"("modificado_por_id");
CREATE TABLE "new_Chat" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "status_id" TEXT,
    "usuario_id" TEXT,
    "ultima_interacao_assistido" TEXT,
    "ultima_interacao_usuario" TEXT,
    "em_fila" BOOLEAN,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Chat_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "Status" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Chat_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Chat_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Chat_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Chat" ("atualizado_em", "criado_em", "em_fila", "id", "status_id", "ultima_interacao_assistido", "ultima_interacao_usuario", "usuario_id") SELECT "atualizado_em", "criado_em", "em_fila", "id", "status_id", "ultima_interacao_assistido", "ultima_interacao_usuario", "usuario_id" FROM "Chat";
DROP TABLE "Chat";
ALTER TABLE "new_Chat" RENAME TO "Chat";
CREATE UNIQUE INDEX "Chat_criado_por_id_key" ON "Chat"("criado_por_id");
CREATE UNIQUE INDEX "Chat_modificado_por_id_key" ON "Chat"("modificado_por_id");
CREATE TABLE "new_Usuario" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL,
    "cpf" TEXT,
    "matricula" TEXT,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Usuario_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Usuario_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Usuario" ("atualizado_em", "cpf", "criado_em", "id", "matricula", "nome") SELECT "atualizado_em", "cpf", "criado_em", "id", "matricula", "nome" FROM "Usuario";
DROP TABLE "Usuario";
ALTER TABLE "new_Usuario" RENAME TO "Usuario";
CREATE UNIQUE INDEX "Usuario_criado_por_id_key" ON "Usuario"("criado_por_id");
CREATE UNIQUE INDEX "Usuario_modificado_por_id_key" ON "Usuario"("modificado_por_id");
CREATE TABLE "new_Canal" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "nome" TEXT NOT NULL,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Canal_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Canal_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Canal" ("atualizado_em", "criado_em", "id", "nome") SELECT "atualizado_em", "criado_em", "id", "nome" FROM "Canal";
DROP TABLE "Canal";
ALTER TABLE "new_Canal" RENAME TO "Canal";
CREATE UNIQUE INDEX "Canal_criado_por_id_key" ON "Canal"("criado_por_id");
CREATE UNIQUE INDEX "Canal_modificado_por_id_key" ON "Canal"("modificado_por_id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
