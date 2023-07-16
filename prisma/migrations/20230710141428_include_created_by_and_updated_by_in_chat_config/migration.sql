-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ChatConfig" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
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
INSERT INTO "new_ChatConfig" ("atualizado_em", "canal_id", "chat_id", "chave_cliente_canal", "criado_em", "id") SELECT "atualizado_em", "canal_id", "chat_id", "chave_cliente_canal", "criado_em", "id" FROM "ChatConfig";
DROP TABLE "ChatConfig";
ALTER TABLE "new_ChatConfig" RENAME TO "ChatConfig";
CREATE UNIQUE INDEX "ChatConfig_criado_por_id_key" ON "ChatConfig"("criado_por_id");
CREATE UNIQUE INDEX "ChatConfig_modificado_por_id_key" ON "ChatConfig"("modificado_por_id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
