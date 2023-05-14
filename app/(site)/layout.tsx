import Header from "../components/header";
import Footer from "../components/footer";

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <>
      <Header />
      <main className="w-full px-8 mx-auto md:max-w-6xl grow">{children}</main>
      <Footer />
    </>
  );
}
