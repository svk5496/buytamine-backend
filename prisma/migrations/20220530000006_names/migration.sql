/*
  Warnings:

  - A unique constraint covering the columns `[name]` on the table `Function` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `RawMaterial` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `Standard` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `name` to the `Function` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `RawMaterial` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Standard` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Function" ADD COLUMN     "name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "RawMaterial" ADD COLUMN     "name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Standard" ADD COLUMN     "name" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "_ProductToRawMaterial" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ProductToStandard" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_FunctionToProduct" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ProductToRawMaterial_AB_unique" ON "_ProductToRawMaterial"("A", "B");

-- CreateIndex
CREATE INDEX "_ProductToRawMaterial_B_index" ON "_ProductToRawMaterial"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ProductToStandard_AB_unique" ON "_ProductToStandard"("A", "B");

-- CreateIndex
CREATE INDEX "_ProductToStandard_B_index" ON "_ProductToStandard"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FunctionToProduct_AB_unique" ON "_FunctionToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_FunctionToProduct_B_index" ON "_FunctionToProduct"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Function_name_key" ON "Function"("name");

-- CreateIndex
CREATE UNIQUE INDEX "RawMaterial_name_key" ON "RawMaterial"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Standard_name_key" ON "Standard"("name");

-- AddForeignKey
ALTER TABLE "_ProductToRawMaterial" ADD FOREIGN KEY ("A") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProductToRawMaterial" ADD FOREIGN KEY ("B") REFERENCES "RawMaterial"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProductToStandard" ADD FOREIGN KEY ("A") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProductToStandard" ADD FOREIGN KEY ("B") REFERENCES "Standard"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FunctionToProduct" ADD FOREIGN KEY ("A") REFERENCES "Function"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FunctionToProduct" ADD FOREIGN KEY ("B") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;
