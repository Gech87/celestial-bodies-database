-- Create the database 

CREATE DATABASE universe; 

\c universe 

  

-- Create the galaxy table 

CREATE TABLE galaxy ( 

    galaxy_id SERIAL PRIMARY KEY, 

    name VARCHAR(255) UNIQUE NOT NULL, 

    size NUMERIC NOT NULL, 

    type TEXT NOT NULL, 

    has_black_hole BOOLEAN NOT NULL 

); 

  

-- Create the star table 

CREATE TABLE star ( 

    star_id SERIAL PRIMARY KEY, 

    name VARCHAR(255) UNIQUE NOT NULL, 

    galaxy_id INT REFERENCES galaxy(galaxy_id) ON DELETE CASCADE, 

    mass INT NOT NULL, 

    is_main_sequence BOOLEAN NOT NULL 

); 

  

-- Create the planet table 

CREATE TABLE planet ( 

    planet_id SERIAL PRIMARY KEY, 

    name VARCHAR(255) UNIQUE NOT NULL, 

    star_id INT REFERENCES star(star_id) ON DELETE CASCADE, 

    radius INT NOT NULL, 

    has_life BOOLEAN NOT NULL, 

    orbital_period NUMERIC NOT NULL 

); 

  

-- Create the moon table 

CREATE TABLE moon ( 

    moon_id SERIAL PRIMARY KEY, 

    name VARCHAR(255) UNIQUE NOT NULL, 

    planet_id INT REFERENCES planet(planet_id) ON DELETE CASCADE, 

    diameter INT NOT NULL, 

    is_tidal_locked BOOLEAN NOT NULL 

); 

  

-- Create an additional table (e.g., asteroid) 

CREATE TABLE asteroid ( 

    asteroid_id SERIAL PRIMARY KEY, 

    name VARCHAR(255) UNIQUE NOT NULL, 

    composition TEXT NOT NULL, 

    mass INT NOT NULL, 

    is_near_earth BOOLEAN NOT NULL 

); 

  

-- Insert sample data into galaxy 

INSERT INTO galaxy (name, size, type, has_black_hole) VALUES 

('Milky Way', 100000, 'Spiral', TRUE), 

('Andromeda', 120000, 'Spiral', TRUE), 

('Triangulum', 60000, 'Spiral', FALSE), 

('Messier 87', 500000, 'Elliptical', TRUE), 

('Sombrero', 50000, 'Spiral', FALSE), 

('Whirlpool', 70000, 'Spiral', TRUE); 

  

-- Insert sample data into star 

INSERT INTO star (name, galaxy_id, mass, is_main_sequence) VALUES 

('Sun', 1, 1989000, TRUE), 

('Sirius', 1, 2032000, TRUE), 

('Betelgeuse', 1, 1500000, FALSE), 

('Alpha Centauri', 1, 2040000, TRUE), 

('Vega', 1, 2100000, TRUE), 

('Rigel', 1, 1900000, FALSE); 

  

-- Insert sample data into planet 

INSERT INTO planet (name, star_id, radius, has_life, orbital_period) VALUES 

('Mercury', 1, 2440, FALSE, 88), 

('Venus', 1, 6052, FALSE, 225), 

('Earth', 1, 6371, TRUE, 365), 

('Mars', 1, 3389, FALSE, 687), 

('Jupiter', 1, 69911, FALSE, 4333), 

('Saturn', 1, 58232, FALSE, 10759), 

('Uranus', 1, 25362, FALSE, 30687), 

('Neptune', 1, 24622, FALSE, 60190), 

('Proxima b', 4, 7150, TRUE, 11), 

('Gliese 581g', 4, 8000, TRUE, 37), 

('Kepler-22b', 6, 12000, TRUE, 290), 

('HD 209458 b', 2, 92000, FALSE, 3.5); 

  

-- Insert sample data into moon 

INSERT INTO moon (name, planet_id, diameter, is_tidal_locked) VALUES 

('Moon', 3, 3474, TRUE), 

('Phobos', 4, 22, TRUE), 

('Deimos', 4, 12, TRUE), 

('Io', 5, 3643, TRUE), 

('Europa', 5, 3121, TRUE), 

('Ganymede', 5, 5268, TRUE), 

('Callisto', 5, 4821, TRUE), 

('Titan', 6, 5150, TRUE), 

('Enceladus', 6, 504, TRUE), 

('Mimas', 6, 396, TRUE), 

('Triton', 8, 2707, TRUE), 

('Charon', 9, 1208, TRUE), 

('Oberon', 7, 1523, TRUE), 

('Titania', 7, 1578, TRUE), 

('Miranda', 7, 471, TRUE), 

('Ariel', 7, 1158, TRUE), 

('Umbriel', 7, 1169, TRUE), 

('Proteus', 8, 420, TRUE), 

('Nereid', 8, 340, FALSE), 

('Halimede', 8, 62, FALSE); 

  

-- Insert sample data into asteroid 

INSERT INTO asteroid (name, composition, mass, is_near_earth) VALUES 

('Ceres', 'Rock, Ice', 939400, FALSE), 

('Pallas', 'Rock, Metal', 210000, FALSE), 

('Vesta', 'Basalt, Metal', 260000, FALSE), 

('Eros', 'Silicate', 6800, TRUE), 

('Apophis', 'Silicate, Metal', 27000, TRUE); 
