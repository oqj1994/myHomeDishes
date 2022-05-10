CREATE TABLE "accounts" (
  "id" SERIAL PRIMARY KEY,
  "user_name" varchar,
  "password_hash" varchar,
  "created_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "peoples" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "upload_account_id" int,
  "desc" text,
  "created_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "comments" (
  "id" SERIAL PRIMARY KEY,
  "content" text,
  "reviewers_id" int ,
  "commented_id" int,
  "created_at" timestamp DEFAULT 'now()'
);

ALTER TABLE "peoples" ADD FOREIGN KEY ("upload_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("reviewers_id") REFERENCES "accounts" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("commented_id") REFERENCES "peoples" ("id");