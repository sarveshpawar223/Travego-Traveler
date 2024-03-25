CREATE DATABASE Travego;
USE Travego;
CREATE TABLE Passenger (
    Passenger_id INT PRIMARY KEY,
    Passenger_name VARCHAR(20),
    Category VARCHAR(20),
    Gender VARCHAR(10),
    Boarding_City VARCHAR(40),
    Destination_City VARCHAR(40),
    Distance INT,
    Bus_Type VARCHAR(30)
);
CREATE TABLE Price (
    id INT PRIMARY KEY,
    Bus_type VARCHAR(20),
    Distance INT,
    Price INT
);
INSERT INTO Passenger (Passenger_id, Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type)
VALUES(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
(2,'Anmol',	'Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
(3,'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
(4,'Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
(5,'Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper'),
(6,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
(7,'Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
(8,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
(9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');

INSERT INTO Price (id, Bus_type, Distance, Price) 
VALUES (1,'Sleeper',350,770),
(2,'Sleeper',500,1100),
(3,'Sleeper',600,1320),
(4,'Sleeper',700,1540),
(5,'Sleeper',1000,2200),
(6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700),
(8,'Sitting',500,620),
(9,'Sitting',600,744),
(10,'Sitting',700,868 ),
(11,'Sitting',1000,1240),
(12,'Sitting',1200,1488),
(13,'Sitting',1500,1860);

-- a.How many females and how many male passengers traveled a minimum distance of 600 KMs?
SELECT 
    Gender, COUNT(*) AS Total_Passengers
FROM
    Passenger
WHERE
    Distance >= 600
GROUP BY Gender;

-- b.Find the minimum ticket price of a Sleeper Bus. 
SELECT 
    MIN(Price) AS Sleeper_Bus
FROM
    Price
WHERE
    Bus_type = 'Sleeper';

-- c.Select passenger names whose names start with character 'S' 
SELECT 
    Passenger_name
FROM
    Passenger
WHERE
    Passenger_name LIKE 'S%';

-- d.Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City,
-- Bus_Type, Price in the output
SELECT 
    Pa.Passenger_name,
    Pa.Boarding_City,
    Pa.Destination_City,
    Pa.Bus_Type,
    Pr.Price
FROM
    Passenger AS Pa
        JOIN
    Price AS Pr ON Pa.Distance = Pr.Distance
        AND Pa.Bus_Type = Pr.Bus_type;
        
--  e.What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  
SELECT 
    Pa.Passenger_name, Pr.Price
FROM
    Passenger AS Pa,
    Price AS Pr
WHERE
    Pa.Distance = 1000
        AND Pa.Bus_type = 'Sitting';

-- f.What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bengaluru to Panaji?
SELECT 
    Bus_type, price
FROM
    price
WHERE
    distance = (SELECT 
            distance
        FROM
            passenger
        WHERE
            passenger_name = 'Pallavi');

-- g.List the distances from the "Passenger" table which are unique (non-repeated distances) in descending
-- order. 
SELECT DISTINCT
    Distance
FROM
    Passenger
ORDER BY Distance DESC;

-- h.Display the passenger name and percentage of distance traveled by that passenger from the total distance
-- traveled by all passengers without using user variables 
SELECT 
    Passenger_name,
    Distance * 100.0 / (SELECT 
            SUM(Distance)
        FROM
            Passenger) AS Total_Distance
FROM
    Passenger;






