drop INDEX genre_index

Explain analyse 
select d.director_id,CONCAT(first_name, ' ', last_name) AS name,genre 
from directors d join directors_genres dg on d.director_id=dg.director_id 
where genre ='Film-Noir' 

create INDEX genre_index
ON directors_genres (genre);

Explain analyse 
select d.director_id,CONCAT(first_name, ' ', last_name) AS name,genre 
from directors d join directors_genres dg on d.director_id=dg.director_id 
where genre ='Film-Noir' 

drop INDEX genre_index
ON directors_genres (genre);


Explain analyse 
select m.movie_id,name,year from movies m join movies_genres mg 
on m.movie_id=mg.movie_id where genre ='Film-Noir' 

CREATE INDEX mgenre_index
ON movies_genres(genre);

Explain analyse 
select m.movie_id,name,year from movies m join movies_genres mg 
on m.movie_id=mg.movie_id where genre ='Film-Noir'  

drop INDEX mgenre_index
ON directors_genres (genre);

