-- Adminer 4.8.0 PostgreSQL 13.2 (Debian 13.2-1.pgdg100+1) dump

<br />
<b>Warning</b>:  PDO::query(): SQLSTATE[42601]: Syntax error: 7 ERROR:  syntax error at or near &quot;STATUS&quot;
LINE 1: SHOW FUNCTION STATUS WHERE Db = 'test'
                      ^ in <b>/var/www/html/adminer.php</b> on line <b>185</b><br />
<br />
<b>Warning</b>:  PDO::query(): SQLSTATE[42601]: Syntax error: 7 ERROR:  syntax error at or near &quot;STATUS&quot;
LINE 1: SHOW PROCEDURE STATUS WHERE Db = 'test'
                       ^ in <b>/var/www/html/adminer.php</b> on line <b>185</b><br />
<br />
<b>Warning</b>:  PDO::query(): SQLSTATE[42703]: Undefined column: 7 ERROR:  column &quot;consrc&quot; does not exist
LINE 1: SELECT conname, consrc
                        ^
HINT:  Perhaps you meant to reference the column &quot;pg_constraint.conkey&quot; or the column &quot;pg_constraint.conbin&quot;. in <b>/var/www/html/adminer.php</b> on line <b>185</b><br />
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

-- 2021-02-25 03:46:49.917912+00
