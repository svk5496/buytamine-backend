-- CreateTable
CREATE TABLE "_NutrientToPrimaryFunction" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_NutrientToPrimaryFunction_AB_unique" ON "_NutrientToPrimaryFunction"("A", "B");

-- CreateIndex
CREATE INDEX "_NutrientToPrimaryFunction_B_index" ON "_NutrientToPrimaryFunction"("B");

-- AddForeignKey
ALTER TABLE "_NutrientToPrimaryFunction" ADD FOREIGN KEY ("A") REFERENCES "Nutrient"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_NutrientToPrimaryFunction" ADD FOREIGN KEY ("B") REFERENCES "PrimaryFunction"("id") ON DELETE CASCADE ON UPDATE CASCADE;
