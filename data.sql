-- Sample Seed Data Insertion Script

-- 1. Insert Employees
INSERT INTO employee (employee_id, last_name, first_name, title, reports_to, levels, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email) 
FROM 'C:\Users\Lenovo\Downloads\music store data\music store data'
DELIMITER ','
CSV HEADER;

-- 2. Insert Customers
INSERT INTO customer (customer_id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) 
FROM 'C:\Users\Lenovo\Downloads\music store data\music store data'
DELIMITER ','
CSV HEADER;

-- 3. Insert Artists
INSERT INTO artist (artist_id, name) 
FROM 'C:\Users\Lenovo\Downloads\music store data\music store data'
DELIMITER ','
CSV HEADER;

-- 4. Insert Albums
INSERT INTO album (album_id, title, artist_id) 
FROM 'C:\Users\Lenovo\Downloads\music store data\music store data'
DELIMITER ','
CSV HEADER;

-- 5. Insert Genres
INSERT INTO genre (genre_id, name) 
FROM 'C:\Users\Lenovo\Downloads\music store data\music store data'
DELIMITER ','
CSV HEADER;

-- 6. Insert Media Types
INSERT INTO media_type (media_type_id, name) 
FROM 'C:\Users\Lenovo\Downloads\music store data\music store data'
DELIMITER ','
CSV HEADER;

-- 7. Insert Tracks
INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) 
FROM 'C:\Users\Lenovo\Downloads\music store data\music store data'
DELIMITER ','
CSV HEADER;

-- 8. Insert Playlists
INSERT INTO playlist (playlist_id, name) 
FROM 'C:\Users\Lenovo\Downloads\music store data\music store data'
DELIMITER ','
CSV HEADER;

-- 9. Insert Playlist Tracks
INSERT INTO playlist_track (playlist_id, track_id) 
FROM 'C:\Users\Lenovo\Downloads\music store data\music store data'
DELIMITER ','
CSV HEADER;

-- 10. Insert Invoices
INSERT INTO invoice (invoice_id, customer_id, invoice_date, billing_address, billing_city, billing_state, billing_country, billing_postal_code, total) 
FROM 'C:\Users\Lenovo\Downloads\music store data\music store data'
DELIMITER ','
CSV HEADER;

-- 11. Insert Invoice Lines
INSERT INTO invoice_line (invoice_line_id, invoice_id, track_id, unit_price, quantity) 
FROM 'C:\Users\Lenovo\Downloads\music store data\music store data'
DELIMITER ','
CSV HEADER;