import "./style.css";
export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="bg-[rgb(204,204,204)] text-black py-2 print:py-0 w-full h-full">
      <main
        dir="rtl"
        className="font-noto mx-auto bg-white [box-shadow:0_0_0.5cm_rgba(0,0,0,0.5)] w-[210mm] h-[297mm]   print:shadow-none"
      >
        {children}
      </main>
    </div>
  );
}
