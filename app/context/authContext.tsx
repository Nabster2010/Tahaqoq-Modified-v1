"use client";
import { Session } from "next-auth";
import { SessionProvider } from "next-auth/react";
import React from "react";
type AuthContextProps = {
  session: Session;
  children: React.ReactNode;
};

const AuthContext = ({ children }: AuthContextProps) => {
  return <SessionProvider>{children}</SessionProvider>;
};

export default AuthContext;
