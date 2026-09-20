-- Sample Seed Data Insertion Script

-- 1. Insert Employees
INSERT INTO employee (employee_id, last_name, first_name, title, reports_to, levels, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email) VALUES
(1, 'Adams', 'Andrew', 'General Manager', NULL, 'L6', '1962-02-18', '2016-08-14', '11120 105 St NW', 'Edmonton', 'AB', 'Canada', 'T5H 2N1', '+1 (780) 428-9482', '+1 (780) 428-3457', 'andrew@chinookcorp.com'),
(2, 'Edwards', 'Nancy', 'Sales Manager', 1, 'L5', '1958-12-08', '2016-05-01', '825 8 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 2T3', '+1 (403) 262-3443', '+1 (403) 262-3322', 'nancy@chinookcorp.com'),
(3, 'Peacock', 'Jane', 'Sales Support Agent', 2, 'L1', '1973-08-29', '2017-04-01', '1111 6 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 0M5', '+1 (403) 262-3443', '+1 (403) 262-6712', 'jane@chinookcorp.com');

-- 2. Insert Customers
INSERT INTO customer (customer_id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) VALUES
(1, 'Luís', 'Gonçalves', 'Embraer - Empresa Brasileira de Aeronáutica S.A.', 'Av. Brigadeiro Faria Lima, 2170', 'São José dos Campos', 'SP', 'Brazil', '12227-000', '+55 (12) 3923-5555', '+55 (12) 3923-5566', 'luisg@embraer.com.br', 3),
(2, 'Leonie', 'Köhler', NULL, 'Theodor-Heuss-Straße 34', 'Stuttgart', NULL, 'Germany', '70174', '+49 0711 2842222', NULL, 'leonekohler@surfeu.de', 3),
(3, 'François', 'Tremblay', NULL, '1498 Rue Bélanger', 'Montréal', 'QC', 'Canada', 'H22 2G7', '+1 (514) 721-4711', NULL, 'ftremblay@gmail.com', 3);

-- 3. Insert Artists
INSERT INTO artist (artist_id, name) VALUES
(1, 'AC/DC'),
(2, 'Accept'),
(3, 'Aerosmith'),
(4, 'Led Zeppelin');

-- 4. Insert Albums
INSERT INTO album (album_id, title, artist_id) VALUES
(1, 'For Those About To Rock We Salute You', 1),
(2, 'Balls to the Wall', 2),
(3, 'Restless and Wild', 2),
(4, 'Led Zeppelin I', 4);

-- 5. Insert Genres
INSERT INTO genre (genre_id, name) VALUES
(1, 'Rock'),
(2, 'Jazz'),
(3, 'Metal');

-- 6. Insert Media Types
INSERT INTO media_type (media_type_id, name) VALUES
(1, 'MPEG audio file'),
(2, 'Protected AAC audio file');

-- 7. Insert Tracks
INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES
(1, 'For Those About To Rock (We Salute You)', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 343719, 11170334, 0.99),
(2, 'Balls to the Wall', 2, 2, 3, 'Accept', 342562, 5510424, 0.99),
(3, 'Fast As a Shark', 3, 1, 3, 'F. Baltes, S. Kaufman, U. Dirkschneider, W. Hoffmann', 230619, 3990994, 0.99),
(4, 'Good Times Bad Times', 4, 1, 1, 'Jimmy Page, John Paul Jones, John Bonham', 166413, 5391484, 0.99);

-- 8. Insert Playlists
INSERT INTO playlist (playlist_id, name) VALUES
(1, 'Music'),
(2, '90’s Music');

-- 9. Insert Playlist Tracks
INSERT INTO playlist_track (playlist_id, track_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4);

-- 10. Insert Invoices
INSERT INTO invoice (invoice_id, customer_id, invoice_date, billing_address, billing_city, billing_state, billing_country, billing_postal_code, total) VALUES
(1, 1, '2023-01-01', 'Av. Brigadeiro Faria Lima, 2170', 'São José dos Campos', 'SP', 'Brazil', '12227-000', 1.98),
(2, 2, '2023-01-02', 'Theodor-Heuss-Straße 34', 'Stuttgart', NULL, 'Germany', '70174', 0.99),
(3, 3, '2023-01-03', '1498 Rue Bélanger', 'Montréal', 'QC', 'Canada', 'H22 2G7', 0.99);

-- 11. Insert Invoice Lines
INSERT INTO invoice_line (invoice_line_id, invoice_id, track_id, unit_price, quantity) VALUES
(1, 1, 1, 0.99, 1),
(2, 1, 4, 0.99, 1),
(3, 2, 2, 0.99, 1),
(4, 3, 3, 0.99, 1);