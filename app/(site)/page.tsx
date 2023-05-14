import Link from "next/link";

export default function Home() {
  return (
    <main className="">
      <div className="flex flex-col items-center justify-center mt-24">
        <h1 className="text-3xl font-bold leading-[3rem] tracking-widest text-center">
          <span className="text-5xl leading-loose">TAHAQOQ</span> <br /> VEHICLE
          INSPECTION CENTER <br /> DAMMAM
        </h1>
        <Link href={"/vehicles"} className="mt-6 btn min-w-[200px] text-lg">
          START
        </Link>
      </div>
    </main>
  );
}
