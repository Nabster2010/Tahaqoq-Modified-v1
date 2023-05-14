-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "role" TEXT NOT NULL DEFAULT 'user',
    "image" TEXT DEFAULT '/images/avatar.png',
    "active" BOOLEAN NOT NULL DEFAULT false,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vehicle" (
    "id" SERIAL NOT NULL,
    "title" TEXT,
    "type" TEXT NOT NULL,
    "palette" TEXT NOT NULL,
    "modelYear" TEXT NOT NULL,
    "oldModel" TEXT NOT NULL,
    "newModel" TEXT NOT NULL,
    "vin" TEXT NOT NULL,
    "requestNo" TEXT NOT NULL,
    "requestDate" TEXT NOT NULL,
    "requestOrigin" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "computerNo" TEXT NOT NULL,
    "modifier" TEXT,
    "reportNo" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Vehicle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Result" (
    "vehicleId" INTEGER NOT NULL,
    "hasModificationReport" BOOLEAN DEFAULT true,
    "color" TEXT NOT NULL,
    "weight" TEXT NOT NULL,
    "dimensions" TEXT NOT NULL,
    "remarks" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Result_pkey" PRIMARY KEY ("vehicleId")
);

-- CreateTable
CREATE TABLE "Engine" (
    "id" INTEGER NOT NULL,
    "modification" BOOLEAN NOT NULL DEFAULT false,
    "pass" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Engine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transmision" (
    "id" INTEGER NOT NULL,
    "modification" BOOLEAN NOT NULL DEFAULT false,
    "pass" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Transmision_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Exhaust" (
    "id" INTEGER NOT NULL,
    "modification" BOOLEAN NOT NULL DEFAULT false,
    "pass" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Exhaust_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Fuel" (
    "id" INTEGER NOT NULL,
    "modification" BOOLEAN NOT NULL DEFAULT false,
    "pass" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Fuel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Brake" (
    "id" INTEGER NOT NULL,
    "modification" BOOLEAN NOT NULL DEFAULT false,
    "pass" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Brake_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Edges" (
    "id" INTEGER NOT NULL,
    "modification" BOOLEAN NOT NULL DEFAULT false,
    "pass" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Edges_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Steering" (
    "id" INTEGER NOT NULL,
    "modification" BOOLEAN NOT NULL DEFAULT false,
    "pass" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Steering_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Wheels" (
    "id" INTEGER NOT NULL,
    "modification" BOOLEAN NOT NULL DEFAULT false,
    "pass" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Wheels_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Entertainment" (
    "id" INTEGER NOT NULL,
    "modification" BOOLEAN NOT NULL DEFAULT false,
    "pass" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Entertainment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Chassis" (
    "id" INTEGER NOT NULL,
    "modification" BOOLEAN NOT NULL DEFAULT false,
    "pass" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Chassis_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Vehicle_title_key" ON "Vehicle"("title");

-- AddForeignKey
ALTER TABLE "Vehicle" ADD CONSTRAINT "Vehicle_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("email") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Result" ADD CONSTRAINT "Result_vehicleId_fkey" FOREIGN KEY ("vehicleId") REFERENCES "Vehicle"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Engine" ADD CONSTRAINT "Engine_id_fkey" FOREIGN KEY ("id") REFERENCES "Result"("vehicleId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transmision" ADD CONSTRAINT "Transmision_id_fkey" FOREIGN KEY ("id") REFERENCES "Result"("vehicleId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Exhaust" ADD CONSTRAINT "Exhaust_id_fkey" FOREIGN KEY ("id") REFERENCES "Result"("vehicleId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Fuel" ADD CONSTRAINT "Fuel_id_fkey" FOREIGN KEY ("id") REFERENCES "Result"("vehicleId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Brake" ADD CONSTRAINT "Brake_id_fkey" FOREIGN KEY ("id") REFERENCES "Result"("vehicleId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Edges" ADD CONSTRAINT "Edges_id_fkey" FOREIGN KEY ("id") REFERENCES "Result"("vehicleId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Steering" ADD CONSTRAINT "Steering_id_fkey" FOREIGN KEY ("id") REFERENCES "Result"("vehicleId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wheels" ADD CONSTRAINT "Wheels_id_fkey" FOREIGN KEY ("id") REFERENCES "Result"("vehicleId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Entertainment" ADD CONSTRAINT "Entertainment_id_fkey" FOREIGN KEY ("id") REFERENCES "Result"("vehicleId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Chassis" ADD CONSTRAINT "Chassis_id_fkey" FOREIGN KEY ("id") REFERENCES "Result"("vehicleId") ON DELETE CASCADE ON UPDATE CASCADE;
