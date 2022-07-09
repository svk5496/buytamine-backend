/*
  Warnings:

  - You are about to drop the column `name` on the `Function` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `RawMaterial` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Standard` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[function]` on the table `Function` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[rawMaterial]` on the table `RawMaterial` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[standard]` on the table `Standard` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `function` to the `Function` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rawMaterial` to the `RawMaterial` table without a default value. This is not possible if the table is not empty.
  - Added the required column `standard` to the `Standard` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Function_name_key";

-- DropIndex
DROP INDEX "RawMaterial_name_key";

-- DropIndex
DROP INDEX "Standard_name_key";

-- AlterTable
ALTER TABLE "Function" DROP COLUMN "name",
ADD COLUMN     "function" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "RawMaterial" DROP COLUMN "name",
ADD COLUMN     "rawMaterial" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Standard" DROP COLUMN "name",
ADD COLUMN     "standard" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Function_function_key" ON "Function"("function");

-- CreateIndex
CREATE UNIQUE INDEX "RawMaterial_rawMaterial_key" ON "RawMaterial"("rawMaterial");

-- CreateIndex
CREATE UNIQUE INDEX "Standard_standard_key" ON "Standard"("standard");
