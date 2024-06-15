-- schema.sql
CREATE SCHEMA myschema;

CREATE TABLE myschema.mytable (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO myschema.mytable (name) VALUES ('Initial Data');
