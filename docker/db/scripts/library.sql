CREATE TABLE "books" (
  "isbn" SERIAL PRIMARY KEY,
  "full_name" varchar,
  "pages" int,
  "author" varchar,
  "year" timestamp,
  "category" int
);

CREATE TABLE "copies" (
  "id" SERIAL PRIMARY KEY,
  "idISBN" int,
  "location" varchar
);

CREATE TABLE "readers" (
  "id" SERIAL PRIMARY KEY,
  "first_name" varchar,
  "second_name" varchar,
  "birth" date,
  "adress" varchar,
  "date_of_return" timestamp,
  "booksId" int
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "full_name" varchar,
  "parentId" int
);

CREATE TABLE "publishers" (
  "id" SERIAL PRIMARY KEY,
  "booksISBN" int,
  "full_name" varchar,
  "adress" varchar
);

ALTER TABLE "books" ADD FOREIGN KEY ("category") REFERENCES "categories" ("id");

ALTER TABLE "copies" ADD FOREIGN KEY ("idISBN") REFERENCES "books" ("isbn");

ALTER TABLE "readers" ADD FOREIGN KEY ("booksId") REFERENCES "copies" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("parentId") REFERENCES "categories" ("id");

ALTER TABLE "publishers" ADD FOREIGN KEY ("booksISBN") REFERENCES "books" ("isbn");
