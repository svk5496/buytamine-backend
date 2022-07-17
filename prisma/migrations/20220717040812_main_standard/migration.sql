/*
  Warnings:

  - You are about to drop the `_MainStandardToProduct` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_MainStandardToProduct" DROP CONSTRAINT "_MainStandardToProduct_A_fkey";

-- DropForeignKey
ALTER TABLE "_MainStandardToProduct" DROP CONSTRAINT "_MainStandardToProduct_B_fkey";

-- AlterTable
ALTER TABLE "MainStandard" ADD COLUMN     "amount" TEXT;

-- DropTable
DROP TABLE "_MainStandardToProduct";
