CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "plugin_tags" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "plugin_id" integer, "tag_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "plugins" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "os" varchar(255), "category_id" integer, "author" varchar(255), "created_at" datetime, "updated_at" datetime, "description" text);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "tags" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "technique_templates" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "technique_id" integer, "name" varchar(255), "filename" boolean DEFAULT 't', "location" boolean DEFAULT 't', "recursively" boolean DEFAULT 't', "hash_type" boolean DEFAULT 't', "hash_value" boolean DEFAULT 't', "content" boolean DEFAULT 't', "mimetype" boolean DEFAULT 't', "created_at" datetime, "updated_at" datetime);
CREATE TABLE "technique_types" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "techniques" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "filename" varchar(255), "location" varchar(255), "technique_type_id" integer DEFAULT 1, "plugin_id" integer, "recursively" boolean DEFAULT 'f', "hash_type" varchar(255), "hash_value" varchar(255), "content" varchar(255), "created_at" datetime, "updated_at" datetime, "mimetype" varchar(255));
CREATE UNIQUE INDEX "index_plugin_tags_on_plugin_id_and_tag_id" ON "plugin_tags" ("plugin_id", "tag_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20110302192204');

INSERT INTO schema_migrations (version) VALUES ('20110302185620');

INSERT INTO schema_migrations (version) VALUES ('20110302185750');

INSERT INTO schema_migrations (version) VALUES ('20110302185654');

INSERT INTO schema_migrations (version) VALUES ('20110312175651');

INSERT INTO schema_migrations (version) VALUES ('20110315210308');

INSERT INTO schema_migrations (version) VALUES ('20110316125021');

INSERT INTO schema_migrations (version) VALUES ('20110322001849');

INSERT INTO schema_migrations (version) VALUES ('20110322150653');

INSERT INTO schema_migrations (version) VALUES ('20110322154647');

INSERT INTO schema_migrations (version) VALUES ('20110322184404');