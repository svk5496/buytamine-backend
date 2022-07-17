/*
  Warnings:

  - A unique constraint covering the columns `[productId]` on the table `MainStandard` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `productId` to the `MainStandard` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "MainStandard" ADD COLUMN     "productId" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "MainStandard_productId_key" ON "MainStandard"("productId");

-- AddForeignKey
ALTER TABLE "MainStandard" ADD CONSTRAINT "MainStandard_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;
