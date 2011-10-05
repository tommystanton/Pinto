CREATE TABLE distribution (
       distribution_id INTEGER PRIMARY KEY NOT NULL,
       path TEXT NOT NULL,
       origin TEXT NOT NULL,
       is_eligible_for_index BOOLEAN DEFAULT 1 NOT NULL
);


CREATE TABLE package (
       package_id INTEGER PRIMARY KEY NOT NULL,
       name TEXT NOT NULL,
       version TEXT NOT NULL,
       is_latest BOOLEAN DEFAULT NULL,
       distribution INTEGER NOT NULL,
       FOREIGN KEY(distribution) REFERENCES distribution(distribution_id)
);


CREATE UNIQUE INDEX distribution_idx ON distribution(path);
CREATE INDEX package_name_idx ON package(name);


CREATE UNIQUE INDEX package_idx ON package(name, distribution);
CREATE UNIQUE INDEX package_should_index_idx ON package(name, is_latest);
