CREATE TABLE movie (
  movie_id SERIAL PRIMARY KEY,
  title varchar(50), 
  media_type_id integer references media_type(media_type_id)
  );
  
  insert into movie (title, media_type_id)
  VALUES ('True Grit',3);

SELECT * from movie

ALTER TABLE movie 
ADD COLUMN genre_id integer references genre(genre_id);

SELECT * from movie

UPDATE movie 
SET genre_id=22
WHERE genre_id=null

UPDATE movie 
SET genre_id=22
WHERE movie_id=1

SELECT album.title, artist.name from album
JOIN artist on artist.artist_id=album.artist_id

SELECT * FROM track
WHERE genre_id IN(
  SELECT genre_id FROM genre
  WHERE name = 'Jazz' or name='Blues'
  );
  UPDATE employee
  SET phone=null 
  WHERE employee_id=1

SELECT * from customer
WHERE company is null;

SELECT artist.artist_id, artist.name, COUNT(*) FROM artist 
JOIN album on artist.artist_id= album.artist_id
GROUP BY artist.artist_id 

SELECT distinct country FROM customer
DELETE FROM customer
WHERE fax = null

Delete Rows
2. 
DELETE from practice_delete
WHERE type='bronze'

3.
DELETE from practice_delete
WHERE type='silver'

4.
DELETE from practice_delete
WHERE value=150