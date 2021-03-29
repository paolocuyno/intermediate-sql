-- Practice Joins

1.
SELECT * from invoice_line
WHERE unit_price>0.99

2.
SELECT invoice.invoice_date, invoice.total, customer.first_name, customer.last_name from invoice
JOIN customer on customer.customer_id=invoice.customer_id

3.
SELECT customer.first_name, customer.last_name, employee.first_name, employee.last_name
from customer
JOIN employee on employee.employee_id=customer.support_rep_id

4.
SELECT album.title, artist.name 
from album
JOIN artist on artist.artist_id=album.artist_id

5.
SELECT playlist_track.playlist_track_id from playlist_track
JOIN playlist on playlist.playlist_id=playlist_track.playlist_id
WHERE playlist.name= 'Music'

6.
SELECT track.name from track
JOIN playlist_track on playlist_track.track_id=track.track_id
WHERE playlist_id=5

7.
SELECT track.name, playlist.name from track
JOIN playlist_track on playlist_track.track_id=track.track_id
JOIN playlist on playlist.playlist_id=playlist_track.playlist_id

8.
SELECT track.name, album.title FROM track
JOIN album on album.album_id=track.album_id
JOIN genre on genre.genre_id=track.genre_id
WHERE genre.name='Alternative & Punk'

-- Practice nested queries
1.
SELECT * from invoice 
WHERE invoice_id IN ( SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99 );

2.
SELECT * from playlist_track
WHERE playlist_id IN ( SELECT playlist_id FROM playlist WHERE name = 'Music' );

3.
SELECT * from playlist_track
WHERE playlist_id IN(SELECT playlist_id from playlist WHERE playlist_id=5);

4.
SELECT * from track
WHERE genre_id IN(SELECT genre_id from genre WHERE name='Comedy');

5.
SELECT * from track
WHERE album_id IN(SELECT album_id from album WHERE title='Fireball')

6.
SELECT * from track
WHERE album_id IN(SELECT album_id from album WHERE artist_id IN(
SELECT artist_id from artist WHERE name='Queen'))

-- //Practice Updating Rows//
1.
UPDATE customer
SET fax=null
WHERE fax is not null

2.
UPDATE customer
SET company='Self'
WHERE company is null

3.
UPDATE customer
SET last_name='Thompson'
WHERE first_name='Julia' AND last_name='Barnett'

4.
UPDATE customer
SET support_rep_id=4
WHERE email='luisrojas@yahoo.cl'

5.
UPDATE track 
SET composer='The darkness around us'
WHERE genre_id IN(SELECT genre_id from genre WHERE name='Metal')

-- Group by

1.
SELECT genre.name, COUNT(*) FROM genre
JOIN track on track.genre_id =genre.genre_id
GROUP BY genre.name

2.
SELECT genre.name, COUNT(*) FROM genre
JOIN track on track.genre_id =genre.genre_id
WHERE genre.name='Pop'
GROUP BY genre.name

SELECT genre.name, COUNT(*) FROM genre
JOIN track on track.genre_id =genre.genre_id
WHERE genre.name='Rock'
GROUP BY genre.name

3.

SELECT artist.name, COUNT(*) FROM artist
JOIN album on album.artist_id =artist.artist_id
GROUP BY artist.name

-- USE DISTINCT
1.SELECT distinct composer FROM track

2. SELECT distinct billing_postal_code FROM invoice

3. SELECT distinct company from customer

E-commerce Simulation

CREATE TABLE users (
  name varchar(50),
 email varchar(50), 
  id SERIAL PRIMARY KEY
  );
  
  CREATE TABLE products (
  name varchar(50),
  id integer PRIMARY KEY, 
  price integer
  );
  
   CREATE TABLE orders (
  order_number SERIAL PRIMARY KEY,
  FOREIGN KEY(id) REFERENCES products(id), 
  total integer,
  user_id integer)
;



   insert into users (name,email)
  VALUES ('Joe','Smith@1.com'),('Jane','Doe@2.com'),('Jay','Jones@3.com')

  insert into products(name,id,price)
VALUES ('Sony', 'PS4',4),('Microsoft', 'Xbox',5),('Nintendo','Wii',6)

insert into orders(id,price )

VALUES (10,20),(20,30),(30,40)

SELECT * FROM orders
WHERE order_number=1

SELECT * FROM orders

SELECT total from orders
where order_number=2

ALTER TABLE users ADD user_id INTEGER;
ALTER TABLE users ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES grades(id);  