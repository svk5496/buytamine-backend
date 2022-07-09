/*
  Warnings:

  - You are about to drop the `Function` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_FunctionToProduct` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_FunctionToProduct" DROP CONSTRAINT "_FunctionToProduct_A_fkey";

-- DropForeignKey
ALTER TABLE "_FunctionToProduct" DROP CONSTRAINT "_FunctionToProduct_B_fkey";

-- DropTable
DROP TABLE "Function";

-- DropTable
DROP TABLE "_FunctionToProduct";

-- CreateTable
CREATE TABLE "PrimaryFunction" (
    "id" SERIAL NOT NULL,
    "primaryFunction" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PrimaryFunction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_PrimaryFunctionToProduct" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "PrimaryFunction_primaryFunction_key" ON "PrimaryFunction"("primaryFunction");

-- CreateIndex
CREATE UNIQUE INDEX "_PrimaryFunctionToProduct_AB_unique" ON "_PrimaryFunctionToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_PrimaryFunctionToProduct_B_index" ON "_PrimaryFunctionToProduct"("B");

-- AddForeignKey
ALTER TABLE "_PrimaryFunctionToProduct" ADD FOREIGN KEY ("A") REFERENCES "PrimaryFunction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PrimaryFunctionToProduct" ADD FOREIGN KEY ("B") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;
