COPY actors
FROM 'C:\actors.csv'
DELIMITER ','
CSV Header;

COPY directors
FROM 'C:\directors.csv'
DELIMITER ','
CSV Header;


COPY directors_genres
FROM 'C:\directors_genres.csv'
DELIMITER ','
CSV Header;

COPY movies
FROM 'C:\movies.csv'
DELIMITER ','
CSV Header;

COPY movies_directors
FROM 'C:\movies_directors.csv'
DELIMITER ','
CSV Header;

COPY movies_genres
FROM 'C:\movies_genres.csv'
DELIMITER ','
CSV Header;


COPY roles
FROM 'C:\roles.csv'
DELIMITER ','
CSV Header;


select count(*) from actors;

