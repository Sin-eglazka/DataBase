CREATE TABLE "stationpersonell" (
  "person_id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "caregivers" (
  "person_id" int,
  "caregiver_id" SERIAL,
  "name" varchar,
  "qualification" varchar,
  PRIMARY KEY ("caregiver_id", "name")
);

CREATE TABLE "doctors" (
  "personal_id" int,
  "doctor_id" SERIAL PRIMARY KEY,
  "name" varchar,
  "area" varchar,
  "rank" int
);

CREATE TABLE "station" (
  "station_id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "rooms" (
  "room_id" SERIAL PRIMARY KEY,
  "beds" int[]
);

CREATE TABLE "patients" (
  "patient_id" SERIAL PRIMARY KEY,
  "name" varchar,
  "disease" varchar,
  "from_time" timestamp,
  "to_time" timestamp
);

ALTER TABLE "caregivers" ADD FOREIGN KEY ("person_id") REFERENCES "stationpersonell" ("person_id");

ALTER TABLE "doctors" ADD FOREIGN KEY ("personal_id") REFERENCES "stationpersonell" ("person_id");

ALTER TABLE "patients" ADD FOREIGN KEY ("patient_id") REFERENCES "doctors" ("doctor_id");

ALTER TABLE "rooms" ADD FOREIGN KEY ("room_id") REFERENCES "station" ("station_id");

ALTER TABLE "patients" ADD FOREIGN KEY ("patient_id") REFERENCES "rooms" ("room_id");

ALTER TABLE "stationpersonell" ADD FOREIGN KEY ("person_id") REFERENCES "station" ("station_id");
