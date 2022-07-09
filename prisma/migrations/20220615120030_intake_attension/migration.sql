/*
  Warnings:

  - You are about to drop the `IntakeAttention` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_IntakeAttentionToProduct` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_IntakeAttentionToProduct" DROP CONSTRAINT "_IntakeAttentionToProduct_A_fkey";

-- DropForeignKey
ALTER TABLE "_IntakeAttentionToProduct" DROP CONSTRAINT "_IntakeAttentionToProduct_B_fkey";

-- DropTable
DROP TABLE "IntakeAttention";

-- DropTable
DROP TABLE "_IntakeAttentionToProduct";
