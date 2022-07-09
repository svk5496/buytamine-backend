-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "coupangLink" TEXT,
ADD COLUMN     "coupangReviewCount" INTEGER DEFAULT 0,
ADD COLUMN     "noUserClick" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "price" INTEGER,
ADD COLUMN     "thombnail" TEXT;
