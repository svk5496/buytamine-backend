-- AlterTable
ALTER TABLE "HealthGoal" ADD COLUMN     "rank" SERIAL NOT NULL;

-- CreateTable
CREATE TABLE "ProductClick" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" INTEGER,
    "productId" INTEGER,

    CONSTRAINT "ProductClick_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HealthGoalClick" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER,
    "healthGoalId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "HealthGoalClick_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ProductClick" ADD CONSTRAINT "ProductClick_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductClick" ADD CONSTRAINT "ProductClick_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HealthGoalClick" ADD CONSTRAINT "HealthGoalClick_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HealthGoalClick" ADD CONSTRAINT "HealthGoalClick_healthGoalId_fkey" FOREIGN KEY ("healthGoalId") REFERENCES "HealthGoal"("id") ON DELETE SET NULL ON UPDATE CASCADE;
