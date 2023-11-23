drop table actors;
drop table directors;
drop table movies;
drop table directors_genres;
drop table movies_directors;
drop table movies_genres;
drop table roles;


create TABLE actors (
	actor_id INT NOT NULL DEFAULT '0',
	first_name VARCHAR(100) NULL DEFAULT NULL,
	last_name VARCHAR(100) NULL DEFAULT NULL ,
	gender CHAR(1) NULL DEFAULT NULL ,
	PRIMARY KEY (actor_id)
)
;

CREATE TABLE roles (
	actor_id INT NOT NULL,
	movie_id INT NOT NULL,
	role VARCHAR(100) NOT NULL ,
	PRIMARY KEY (actor_id, movie_id, role) ,
	FOREIGN KEY (actor_id) REFERENCES actors(actor_id) ,
	FOREIGN KEY (movie_id) REFERENCES movies(movie_id) 
)
;

CREATE TABLE directors (
	director_id INT NOT NULL DEFAULT '0',
	first_name VARCHAR(100) NULL DEFAULT NULL,
	last_name VARCHAR(100) NULL DEFAULT NULL,
	PRIMARY KEY (director_id)
)
;

CREATE TABLE directors_genres (
	director_id INT NOT NULL,
	genre VARCHAR(100) NOT NULL,
	prob FLOAT NULL DEFAULT NULL,
	PRIMARY KEY (director_id, genre),
	FOREIGN KEY (director_id) REFERENCES directors(director_id) 
)
;

CREATE TABLE movies_genres (
	movie_id INT NOT NULL,
	genre VARCHAR(100) NOT NULL ,
	PRIMARY KEY (movie_id, genre) ,
	FOREIGN KEY (movie_id) REFERENCES movies(movie_id) 
)
;

CREATE TABLE movies (
	movie_id INT NOT NULL DEFAULT '0',
	name VARCHAR(100) NULL DEFAULT NULL,
	year INT NULL DEFAULT NULL,
	rank FLOAT NULL DEFAULT NULL,
	PRIMARY KEY (movie_id) 
)
;

CREATE TABLE movies_directors (
	director_id INT NOT NULL,
	movie_id INT NOT NULL,
	PRIMARY KEY (director_id, movie_id) ,
	FOREIGN KEY (director_id) REFERENCES directors(director_id) ,
	FOREIGN KEY (movie_id) REFERENCES movies(movie_id) 
)
;






