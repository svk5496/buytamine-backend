/*
  Warnings:

  - A unique constraint covering the columns `[mainStandard]` on the table `MainStandard` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "MainStandard_mainStandard_key" ON "MainStandard"("mainStandard");
