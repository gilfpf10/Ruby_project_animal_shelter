DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS animals;

CREATE TABLE  animals
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  admission DATE,
  age INT8,
  availability VARCHAR(255),
  type VARCHAR(255)
);

CREATE TABLE owners
(
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE adoptions
(
  id SERIAL8 primary key,
  animal_id INT8 references animals(id),
  owner_id INT8 references owners(id)
);
