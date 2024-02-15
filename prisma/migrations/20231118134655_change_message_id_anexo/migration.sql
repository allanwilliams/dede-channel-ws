/*
  Warnings:

  - You are about to drop the column `mensagem_id` on the `Anexo` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Anexo" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "modificado_em" DATETIME,
    "file" TEXT NOT NULL,
    "tipo" INTEGER NOT NULL,
    "mensagemId" TEXT,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "Anexo_mensagemId_fkey" FOREIGN KEY ("mensagemId") REFERENCES "Mensagem" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Anexo_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Anexo_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Anexo" ("criado_em", "criado_por_id", "file", "id", "modificado_em", "modificado_por_id", "tipo") SELECT "criado_em", "criado_por_id", "file", "id", "modificado_em", "modificado_por_id", "tipo" FROM "Anexo";
DROP TABLE "Anexo";
ALTER TABLE "new_Anexo" RENAME TO "Anexo";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
