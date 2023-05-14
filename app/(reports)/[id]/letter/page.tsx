import { getVehicleById } from "@/lib/prisma/vehicle";
import Letter from "./letter";

export async function generateMetadata({ params }: any) {
  const vehicle: any = await getVehicleById(parseInt(params.id));
  return { title: `${vehicle?.title} - letter` };
}

const page = async ({ params }: any) => {
  const vehicleId = parseInt(params.id);
  const vehicle: any = await getVehicleById(vehicleId);
  if (!vehicle) return <h1>vehicle not found</h1>;
  if (vehicle?.result === null) return <h1>Vehicle has no result</h1>;

  return (
    <>
      <Letter vehicle={vehicle} />
    </>
  );
};

export default page;
