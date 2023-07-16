-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ChatConfig" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "modificado_em" DATETIME,
    "canal_id" TEXT NOT NULL,
    "chave_cliente_canal" TEXT NOT NULL,
    "chat_id" TEXT,
    "tipo_contato_id" TEXT,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "ChatConfig_canal_id_fkey" FOREIGN KEY ("canal_id") REFERENCES "Canal" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ChatConfig_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "Chat" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "ChatConfig_tipo_contato_id_fkey" FOREIGN KEY ("tipo_contato_id") REFERENCES "TipoContato" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "ChatConfig_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "ChatConfig_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_ChatConfig" ("canal_id", "chat_id", "chave_cliente_canal", "criado_em", "criado_por_id", "id", "modificado_em", "modificado_por_id") SELECT "canal_id", "chat_id", "chave_cliente_canal", "criado_em", "criado_por_id", "id", "modificado_em", "modificado_por_id" FROM "ChatConfig";
DROP TABLE "ChatConfig";
ALTER TABLE "new_ChatConfig" RENAME TO "ChatConfig";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
