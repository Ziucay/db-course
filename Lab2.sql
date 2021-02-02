-- Database: MOVIE_DB

-- DROP DATABASE "MOVIE_DB";

CREATE DATABASE "MOVIE_DB"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
C MOVIE_DB;
	
CREATE TABLE movie (
	movie_id SERIAL,
	title TEXT,
	year_ INT,
	length_ INT,
	production_company_id TEXT,
	plot TEXT,
	PRIMARY KEY (movie_id)
);

CREATE TABLE genre (
	movie_id INT,
	FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
	genre TEXT,
	PRIMARY KEY (movie_id)
);

CREATE TABLE production_company (
	name_ TEXT,
	address TEXT,
	PRIMARY KEY (name_)
);

ALTER TABLE movie ADD 
	FOREIGN KEY (production_company_id) REFERENCES production_company (name_);
	
CREATE TABLE person (
	person_id SERIAL,
	name_ TEXT,
	date_of_birth DATE,
	PRIMARY KEY (person_id)
);

CREATE TABLE person_movie (
	movie_id INT,
	person_id INT,
	role_ TEXT,
	FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
	FOREIGN KEY (person_id) REFERENCES person (person_id),
	PRIMARY KEY (movie_id, person_id, role_)
);

CREATE TABLE quotes (
	movie_id INT,
	person_id INT,
	quote_ TEXT,
	FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
	FOREIGN KEY (person_id) REFERENCES person (person_id),
	PRIMARY KEY (movie_id, person_id, quote_)
);