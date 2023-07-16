/*
  Warnings:

  - You are about to drop the column `atualizado_em` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `atualizado_em` on the `Canal` table. All the data in the column will be lost.
  - You are about to drop the column `atualizado_em` on the `Chat` table. All the data in the column will be lost.
  - You are about to drop the column `atualizado_em` on the `Status` table. All the data in the column will be lost.
  - You are about to drop the column `atualizado_em` on the `Finalizacao` table. All the data in the column will be lost.
  - You are about to drop the column `atualizado_em` on the `Anexo` table. All the data in the column will be lost.
  - You are about to drop the column `atualizado_em` on the `Assistido` table. All the data in the column will be lost.
  - You are about to drop the column `atualizado_em` on the `ChatConfig` table. All the data in the column will be lost.
  - You are about to drop the column `atualizado_em` on the `Historico` table. All the data in the column will be lost.
  - You are about to drop the column `atualizado_em` on the `Mensagem` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Usuario" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "modificado_em" DATETIME,
    "nome" TEXT NOT NULL,
    "cpf" TEXT,
    "matricula" TEXT,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Usuario_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Usuario_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Usuario" ("cpf", "criado_em", "criado_por_id", "id", "matricula", "modificado_por_id", "nome") SELECT "cpf", "criado_em", "criado_por_id", "id", "matricula", "modificado_por_id", "nome" FROM "Usuario";
DROP TABLE "Usuario";
ALTER TABLE "new_Usuario" RENAME TO "Usuario";
CREATE TABLE "new_Canal" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "modificado_em" DATETIME,
    "nome" TEXT NOT NULL,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Canal_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Canal_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Canal" ("criado_em", "criado_por_id", "id", "modificado_por_id", "nome") SELECT "criado_em", "criado_por_id", "id", "modificado_por_id", "nome" FROM "Canal";
DROP TABLE "Canal";
ALTER TABLE "new_Canal" RENAME TO "Canal";
CREATE TABLE "new_Chat" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "modificado_em" DATETIME,
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
INSERT INTO "new_Chat" ("criado_em", "criado_por_id", "em_fila", "id", "modificado_por_id", "status_id", "ultima_interacao_assistido", "ultima_interacao_usuario", "usuario_id") SELECT "criado_em", "criado_por_id", "em_fila", "id", "modificado_por_id", "status_id", "ultima_interacao_assistido", "ultima_interacao_usuario", "usuario_id" FROM "Chat";
DROP TABLE "Chat";
ALTER TABLE "new_Chat" RENAME TO "Chat";
CREATE TABLE "new_Status" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "modificado_em" DATETIME,
    "nome" TEXT NOT NULL,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Status_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Status_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Status" ("criado_em", "criado_por_id", "id", "modificado_por_id", "nome") SELECT "criado_em", "criado_por_id", "id", "modificado_por_id", "nome" FROM "Status";
DROP TABLE "Status";
ALTER TABLE "new_Status" RENAME TO "Status";
CREATE TABLE "new_Finalizacao" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "modificado_em" DATETIME,
    "nome" TEXT NOT NULL,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Finalizacao_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Finalizacao_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Finalizacao" ("criado_em", "criado_por_id", "id", "modificado_por_id", "nome") SELECT "criado_em", "criado_por_id", "id", "modificado_por_id", "nome" FROM "Finalizacao";
DROP TABLE "Finalizacao";
ALTER TABLE "new_Finalizacao" RENAME TO "Finalizacao";
CREATE TABLE "new_Anexo" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "modificado_em" DATETIME,
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
INSERT INTO "new_Anexo" ("criado_em", "criado_por_id", "file", "id", "mensagemId", "mensagem_id", "modificado_por_id", "tipo") SELECT "criado_em", "criado_por_id", "file", "id", "mensagemId", "mensagem_id", "modificado_por_id", "tipo" FROM "Anexo";
DROP TABLE "Anexo";
ALTER TABLE "new_Anexo" RENAME TO "Anexo";
CREATE TABLE "new_Assistido" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "modificado_em" DATETIME,
    "nome" TEXT NOT NULL,
    "cpf" TEXT,
    "chat_id" TEXT,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Assistido_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "Chat" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Assistido_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Assistido_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Assistido" ("chat_id", "cpf", "criado_em", "criado_por_id", "id", "modificado_por_id", "nome") SELECT "chat_id", "cpf", "criado_em", "criado_por_id", "id", "modificado_por_id", "nome" FROM "Assistido";
DROP TABLE "Assistido";
ALTER TABLE "new_Assistido" RENAME TO "Assistido";
CREATE UNIQUE INDEX "Assistido_chat_id_key" ON "Assistido"("chat_id");
CREATE TABLE "new_ChatConfig" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "modificado_em" DATETIME,
    "canal_id" TEXT NOT NULL,
    "chave_cliente_canal" TEXT NOT NULL,
    "chat_id" TEXT,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "ChatConfig_canal_id_fkey" FOREIGN KEY ("canal_id") REFERENCES "Canal" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ChatConfig_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "Chat" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "ChatConfig_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "ChatConfig_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_ChatConfig" ("canal_id", "chat_id", "chave_cliente_canal", "criado_em", "criado_por_id", "id", "modificado_por_id") SELECT "canal_id", "chat_id", "chave_cliente_canal", "criado_em", "criado_por_id", "id", "modificado_por_id" FROM "ChatConfig";
DROP TABLE "ChatConfig";
ALTER TABLE "new_ChatConfig" RENAME TO "ChatConfig";
CREATE TABLE "new_Historico" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "modificado_em" DATETIME,
    "anotacao" TEXT NOT NULL,
    "protocolo" TEXT NOT NULL,
    "chat_id" TEXT,
    "chat_config_id" TEXT NOT NULL,
    "status_id" TEXT NOT NULL,
    "finalizacao_id" TEXT NOT NULL,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Historico_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "Chat" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Historico_chat_config_id_fkey" FOREIGN KEY ("chat_config_id") REFERENCES "ChatConfig" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Historico_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "Status" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Historico_finalizacao_id_fkey" FOREIGN KEY ("finalizacao_id") REFERENCES "Finalizacao" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Historico_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Historico_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Historico" ("anotacao", "chat_config_id", "chat_id", "criado_em", "criado_por_id", "finalizacao_id", "id", "modificado_por_id", "protocolo", "status_id") SELECT "anotacao", "chat_config_id", "chat_id", "criado_em", "criado_por_id", "finalizacao_id", "id", "modificado_por_id", "protocolo", "status_id" FROM "Historico";
DROP TABLE "Historico";
ALTER TABLE "new_Historico" RENAME TO "Historico";
CREATE TABLE "new_Mensagem" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "modificado_em" DATETIME,
    "mensagem" TEXT NOT NULL,
    "chat_config_id" TEXT NOT NULL,
    "chat_id" TEXT NOT NULL,
    "lida" BOOLEAN NOT NULL,
    "from_assistido" BOOLEAN NOT NULL,
    "from_bot" BOOLEAN,
    "usuario_id" TEXT,
    "ack" INTEGER NOT NULL,
    "oculta" BOOLEAN,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Mensagem_chat_config_id_fkey" FOREIGN KEY ("chat_config_id") REFERENCES "ChatConfig" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Mensagem_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "Chat" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Mensagem_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Mensagem_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Mensagem" ("ack", "chat_config_id", "chat_id", "criado_em", "criado_por_id", "from_assistido", "from_bot", "id", "lida", "mensagem", "modificado_por_id", "oculta", "usuario_id") SELECT "ack", "chat_config_id", "chat_id", "criado_em", "criado_por_id", "from_assistido", "from_bot", "id", "lida", "mensagem", "modificado_por_id", "oculta", "usuario_id" FROM "Mensagem";
DROP TABLE "Mensagem";
ALTER TABLE "new_Mensagem" RENAME TO "Mensagem";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
