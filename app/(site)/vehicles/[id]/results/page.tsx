import { getVehicleById } from "@/lib/prisma/vehicle";
import { Vehicle } from "@/types";
import AddResultForm from "../../../../components/addResultForm";
import UpdateResultForm from "../../../../components/updateResultForm";

const page = async ({
  params,
}: {
  params: {
    id: string;
  };
}) => {
  const vehicleId = parseInt(params.id);
  const vehicle: any = await getVehicleById(vehicleId);

  if (!vehicle) return <h1>no vehicle found</h1>;

  const vehicleHasResult = vehicle?.result !== null;

  return vehicleHasResult ? (
    <UpdateResultForm vehicleResult={JSON.stringify(vehicle.result)} />
  ) : (
    <AddResultForm vehicleId={vehicle?.id} />
  );
};

export default page;
