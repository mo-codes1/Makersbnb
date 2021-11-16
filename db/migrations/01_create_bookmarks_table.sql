CREATE TABLE spaces(id SERIAL PRIMARY KEY, name VARCHAR(60), available BOOL);
INSERT INTO spaces (name, available) VALUES ('Windsor Castle', true);
INSERT INTO spaces (name, available) VALUES ('Roka Rooms', true);