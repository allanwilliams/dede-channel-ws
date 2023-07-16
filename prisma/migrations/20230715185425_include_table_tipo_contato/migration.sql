-- CreateTable
CREATE TABLE "TipoContato" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "criado_em" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "modificado_em" DATETIME,
    "criado_por_id" TEXT,
    "modificado_por_id" TEXT,
    CONSTRAINT "TipoContato_criado_por_id_fkey" FOREIGN KEY ("criado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "TipoContato_modificado_por_id_fkey" FOREIGN KEY ("modificado_por_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
