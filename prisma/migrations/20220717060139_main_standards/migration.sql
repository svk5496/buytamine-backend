/*
  Warnings:

  - You are about to drop the column `productId` on the `MainStandard` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "MainStandard" DROP CONSTRAINT "MainStandard_productId_fkey";

-- DropIndex
DROP INDEX "MainStandard_productId_key";

-- AlterTable
ALTER TABLE "MainStandard" DROP COLUMN "productId";

-- CreateTable
CREATE TABLE "_MainStandardToProduct" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_MainStandardToProduct_AB_unique" ON "_MainStandardToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_MainStandardToProduct_B_index" ON "_MainStandardToProduct"("B");

-- AddForeignKey
ALTER TABLE "_MainStandardToProduct" ADD FOREIGN KEY ("A") REFERENCES "MainStandard"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MainStandardToProduct" ADD FOREIGN KEY ("B") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;
