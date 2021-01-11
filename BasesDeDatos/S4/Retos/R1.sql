CREATE DATABASE IF NOT EXISTS Nombre;
USE Nombre;


CREATE TABLE users (
   id INT PRIMARY KEY, 
   genero VARCHAR(1), 
   edad INT,
   ocup INT,
   cp VARCHAR(20)
);

DROP TABLE IF EXISTS nombre;


CREATE TABLE IF NOT EXISTS movies(
	id INT PRIMARY KEY,
    title VARCHAR(80),
	genre VARCHAR(80)
);


CREATE TABLE IF NOT EXISTS ratings(
	userid INT,
    movieid INT,
    rating INT,
    time_stamp TIMESTAMP
    
);
