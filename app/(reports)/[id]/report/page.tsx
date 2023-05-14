import { getVehicleById } from "@/lib/prisma/vehicle";
import Report from "./report";

export async function generateMetadata({ params }: any) {
  const vehicle: any = await getVehicleById(parseInt(params.id));
  return { title: vehicle?.title };
}

const page = async ({ params }: any) => {
  const vehicleId = parseInt(params.id);
  const vehicle: any = await getVehicleById(vehicleId);
  if (!vehicle) return <h1>vehicle not found</h1>;
  if (vehicle?.result === null) return <h1>Vehicle has no result</h1>;

  return (
    <>
      <Report vehicle={vehicle} />
    </>
  );
};

export default page;
