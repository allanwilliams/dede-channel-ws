/*
  Warnings:

  - You are about to drop the column `canal_id` on the `Mensagem` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
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
    CONSTRAINT "Mensagem_chat_config_id_fkey" FOREIGN KEY ("chat_config_id") REFERENCES "ChatConfig" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Mensagem_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "Chat" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Mensagem" ("ack", "atualizado_em", "chat_config_id", "chat_id", "criado_em", "data_hora", "from_assistido", "from_bot", "id", "lida", "mensagem", "oculta", "usuario_id") SELECT "ack", "atualizado_em", "chat_config_id", "chat_id", "criado_em", "data_hora", "from_assistido", "from_bot", "id", "lida", "mensagem", "oculta", "usuario_id" FROM "Mensagem";
DROP TABLE "Mensagem";
ALTER TABLE "new_Mensagem" RENAME TO "Mensagem";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
