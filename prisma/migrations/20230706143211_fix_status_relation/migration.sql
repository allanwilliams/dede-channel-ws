-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Chat" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    "status_id" TEXT,
    "usuario_id" TEXT,
    "ultima_interacao_assistido" TEXT,
    "ultima_interacao_usuario" TEXT,
    "em_fila" BOOLEAN,
    CONSTRAINT "Chat_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "Status" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Chat_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Chat" ("atualizado_em", "criado_em", "em_fila", "id", "status_id", "ultima_interacao_assistido", "ultima_interacao_usuario", "usuario_id") SELECT "atualizado_em", "criado_em", "em_fila", "id", "status_id", "ultima_interacao_assistido", "ultima_interacao_usuario", "usuario_id" FROM "Chat";
DROP TABLE "Chat";
ALTER TABLE "new_Chat" RENAME TO "Chat";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
