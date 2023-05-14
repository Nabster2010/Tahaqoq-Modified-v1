"use client";
import { useRouter } from "next/navigation";
import { ChangeEvent, useRef, useState } from "react";
import { useSearchParams } from "next/navigation";

type SearchFormProps = {
  page: number;
  pageSize: number;
};

const SearchForm = ({ page, pageSize }: SearchFormProps) => {
  const router = useRouter();
  const [text, setText] = useState("");
  const searchParams: any = useSearchParams();
  // const page = searchParams.get("page");
  // const pageSize = searchParams.get("pageSize");
  const inputRef = useRef<HTMLInputElement>(null);
  const handleSearch = (e: ChangeEvent<HTMLFormElement>) => {
    e.preventDefault();
    if (!inputRef.current) return;
    const query = inputRef.current?.value.trim();
    // if (!query || query === "") return;
    router.push(`/vehicles?page=${page}&pageSize=${pageSize}&search=${query}`);
    setText(query);
    inputRef.current.value = "";
  };
  const clearSearch = () => {
    setText("");
    return router.push(`/vehicles?page=${page}&pageSize=${pageSize}`);
  };
  return (
    <form className="" onSubmit={handleSearch}>
      <div className="flex gap-2">
        <input
          ref={inputRef}
          type="search"
          placeholder="Search...."
          className="w-full max-w-xs input input-bordered"
        />
        <button className="btn" type="submit">
          Search
        </button>
      </div>
      {!!text && (
        <div className="flex items-center gap-2 mt-2">
          <p>{text}</p>
          <button onClick={clearSearch} className="btn btn-square btn-outline">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              className="w-6 h-6"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth="2"
                d="M6 18L18 6M6 6l12 12"
              />
            </svg>
          </button>
        </div>
      )}
    </form>
  );
};

export default SearchForm;
