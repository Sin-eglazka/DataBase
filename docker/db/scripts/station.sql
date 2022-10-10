CREATE TABLE "stations" (
  "station_id" SERIAL PRIMARY KEY,
  "name" varchar,
  "tracks" int,
  "starts_trains" int,
  "end_trains" int
);

CREATE TABLE "cities" (
  "id_city" SERIAL PRIMARY KEY,
  "region" varchar,
  "name" varchar
);

CREATE TABLE "trains" (
  "train_id" SERIAL PRIMARY KEY,
  "length" int,
  "arrive" timestamp,
  "departure" timestamp
);

ALTER TABLE "trains" ADD FOREIGN KEY ("train_id") REFERENCES "stations" ("station_id");

ALTER TABLE "stations" ADD FOREIGN KEY ("station_id") REFERENCES "cities" ("id_city");
