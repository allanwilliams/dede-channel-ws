/*
  Warnings:

  - You are about to drop the column `chatId` on the `Historico` table. All the data in the column will be lost.
  - You are about to drop the column `usuario_id` on the `Historico` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Historico" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
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
INSERT INTO "new_Historico" ("anotacao", "atualizado_em", "chat_config_id", "chat_id", "criado_em", "criado_por_id", "finalizacao_id", "id", "modificado_por_id", "protocolo", "status_id") SELECT "anotacao", "atualizado_em", "chat_config_id", "chat_id", "criado_em", "criado_por_id", "finalizacao_id", "id", "modificado_por_id", "protocolo", "status_id" FROM "Historico";
DROP TABLE "Historico";
ALTER TABLE "new_Historico" RENAME TO "Historico";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
