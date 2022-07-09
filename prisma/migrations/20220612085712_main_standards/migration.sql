/*
  Warnings:

  - You are about to drop the `Standard` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ProductToStandard` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_ProductToStandard" DROP CONSTRAINT "_ProductToStandard_A_fkey";

-- DropForeignKey
ALTER TABLE "_ProductToStandard" DROP CONSTRAINT "_ProductToStandard_B_fkey";

-- DropTable
DROP TABLE "Standard";

-- DropTable
DROP TABLE "_ProductToStandard";

-- CreateTable
CREATE TABLE "MainStandard" (
    "id" SERIAL NOT NULL,
    "mainStandard" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MainStandard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_MainStandardToProduct" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "MainStandard_mainStandard_key" ON "MainStandard"("mainStandard");

-- CreateIndex
CREATE UNIQUE INDEX "_MainStandardToProduct_AB_unique" ON "_MainStandardToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_MainStandardToProduct_B_index" ON "_MainStandardToProduct"("B");

-- AddForeignKey
ALTER TABLE "_MainStandardToProduct" ADD FOREIGN KEY ("A") REFERENCES "MainStandard"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MainStandardToProduct" ADD FOREIGN KEY ("B") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;
