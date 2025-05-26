-- Create rangers table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name varchar(20),
    region VARCHAR(20)
);

-- Create species table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name varchar(50),
    scientific_name VARCHAR(50),
    discovery_date DATE,
    conservation_status VARCHAR(100)
);

-- Create sightings table
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT,
    ranger_id INT,
    location VARCHAR(100),
    sighting_time TIMESTAMP,
    notes varchar(100)
);


-- Insert into rangers
INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains'),
    ('Bob White', 'River Delta'),
    ('Carol King','Mountain Range'),
    ('Queen Carol','Mountain Plains');


-- Insert into species
INSERT INTO species(common_name,scientific_name,discovery_date,conservation_status) 
VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
('Asiatic Elephant', 'Elephas maximus indicus', '1759-01-02', 'Endangered'),
('Asiatic Elephant', 'Elephas maximus indicus', '1765-01-05', 'Endangered'),
('Dodo','Raphus cucullatus', '1601-01-01', 'Extinct'),
('Woolly Mammoth', 'Mammuthus primigenius', '1796-01-01', 'Extinct'),
('Woolly Rhinoceros', 'Coelodonta antiquitatis', '1798-01-01', 'Extinct'),
('Saber-toothed Cat', 'Smilodon fatalis', '1822-01-01', 'Extinct');


-- Insert into sightings
INSERT INTO sightings(species_id, ranger_id, location, sighting_time, notes)
VALUES
(1 ,1 , 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2 ,2 , 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3 ,3 , 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1 ,2 , 'Snowfall Pass', '2024-05-18 18:30:00', NULL),
(1 ,1 , 'Icefall Pass', '2024-06-18 22:30:00', 'Captured from Ship');



-- Problem 1
INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');

-- Problem 2
SELECT COUNT(*) FROM (
SELECT common_name, count(*) FROM species GROUP BY common_name 
HAVING COUNT(*)=1
);

-- Problem 3
SELECT * FROM sightings 
WHERE location LIKE '%Pass%'

-- Problem 4

SELECT name, count(sighting_id) as total_sightings FROM rangers
LEFT JOIN sightings ON rangers.ranger_id = sightings.ranger_id GROUP BY rangers.name;


-- Problem 5

SELECT common_name FROM species
left JOIN sightings ON species.species_id = sightings.species_id
WHERE sightings.sighting_id IS NULL GROUP BY common_name;

-- Problem 6
SELECT common_name,sighting_time,name FROM sightings st 
JOIN species sp ON st.species_id = sp.species_id
JOIN rangers rng ON st.ranger_id = rng.ranger_id
ORDER BY sighting_time DESC LIMIT 2;


-- Problem 7
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

-- Problem 8
SELECT sighting_id,
       CASE
           WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
           WHEN EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'
           ELSE 'Evening'
       END AS time_of_day
FROM sightings;


-- Problem 9
DELETE FROM rangers
WHERE ranger_id NOT IN (SELECT ranger_id FROM sightings);




