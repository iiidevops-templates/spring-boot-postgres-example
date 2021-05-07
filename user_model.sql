-- Adminer 4.8.0 PostgreSQL 13.2 (Debian 13.2-1.pgdg100+1) dump

DROP TABLE IF EXISTS "user_model";
CREATE TABLE "public"."user_model" (
    "id" bigint NOT NULL,
    "name" character varying(255),
    CONSTRAINT "user_model_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

TRUNCATE "user_model";
INSERT INTO "user_model" ("id", "name") VALUES
(1,	'iiiorg-dev'),
(4,	'user_1'),
(14,	'user-11'),
(10,	'user-id-10');

create sequence HIBERNATE_SEQUENCE
minvalue 100000
maxvalue 9999999999999999
start with 100060
increment by 1
cache 20;

-- 2021-02-25 03:46:49.917912+00
