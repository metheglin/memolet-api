CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar NOT NULL, "crypted_password" varchar, "salt" varchar, "auth_token" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE TABLE "tags" ("id" bigint NOT NULL PRIMARY KEY, "user_id" bigint NOT NULL, "name" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "entries" ("id" bigint NOT NULL PRIMARY KEY, "user_id" bigint NOT NULL, "kind" varchar(16) DEFAULT 'memo' NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "tags_entries" ("id" bigint NOT NULL PRIMARY KEY, "tag_id" bigint NOT NULL, "entry_id" bigint NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "memos" ("id" bigint NOT NULL, "content" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO schema_migrations (version) VALUES
('20170108132722'),
('20170120050752'),
('20170120050918'),
('20170120051404'),
('20170121102035');


