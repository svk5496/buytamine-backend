-- CreateTable
CREATE TABLE "HealthGoal" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "iconSmall" TEXT,
    "iconMedium" TEXT,
    "iconLarge" TEXT,
    "bio" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "HealthGoal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Nutrient" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "bio" TEXT,
    "banner" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Nutrient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_HealthGoalToProduct" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_NutrientToProduct" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_HealthGoalToProduct_AB_unique" ON "_HealthGoalToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_HealthGoalToProduct_B_index" ON "_HealthGoalToProduct"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_NutrientToProduct_AB_unique" ON "_NutrientToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_NutrientToProduct_B_index" ON "_NutrientToProduct"("B");

-- AddForeignKey
ALTER TABLE "_HealthGoalToProduct" ADD FOREIGN KEY ("A") REFERENCES "HealthGoal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HealthGoalToProduct" ADD FOREIGN KEY ("B") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_NutrientToProduct" ADD FOREIGN KEY ("A") REFERENCES "Nutrient"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_NutrientToProduct" ADD FOREIGN KEY ("B") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;
