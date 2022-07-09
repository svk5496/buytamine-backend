-- CreateTable
CREATE TABLE "IntakeAttention" (
    "id" SERIAL NOT NULL,
    "intakeAttention" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "IntakeAttention_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_IntakeAttentionToProduct" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "IntakeAttention_intakeAttention_key" ON "IntakeAttention"("intakeAttention");

-- CreateIndex
CREATE UNIQUE INDEX "_IntakeAttentionToProduct_AB_unique" ON "_IntakeAttentionToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_IntakeAttentionToProduct_B_index" ON "_IntakeAttentionToProduct"("B");

-- AddForeignKey
ALTER TABLE "_IntakeAttentionToProduct" ADD FOREIGN KEY ("A") REFERENCES "IntakeAttention"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_IntakeAttentionToProduct" ADD FOREIGN KEY ("B") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;
