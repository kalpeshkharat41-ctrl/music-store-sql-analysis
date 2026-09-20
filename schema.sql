-- Schema creation script for Music Store Database
-- 1. Employee Table
CREATE TABLE employee (
    employee_id INTEGER PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    title VARCHAR(100),
    reports_to INTEGER REFERENCES employee(employee_id),
    levels VARCHAR(5),
    birthdate DATE,
    hire_date DATE,
    address VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    phone VARCHAR(20),
    fax VARCHAR(20),
    email VARCHAR(50));

-- 2. Customer Table
CREATE TABLE customer (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    company VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    phone VARCHAR(20),
    fax VARCHAR(20),
    email VARCHAR(50) NOT NULL,
    support_rep_id INTEGER REFERENCES employee(employee_id));

-- 3. Artist Table
CREATE TABLE artist (
    artist_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL);

-- 4. Album Table
CREATE TABLE album (
    album_id INTEGER PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist_id INTEGER REFERENCES artist(artist_id));

-- 5. Genre Table
CREATE TABLE genre (
    genre_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL);

-- 6. Media Type Table
CREATE TABLE media_type (
    media_type_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL);

-- 7. Track Table
CREATE TABLE track (
    track_id INTEGER PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    album_id INTEGER REFERENCES album(album_id),
    media_type_id INTEGER REFERENCES media_type(media_type_id),
    genre_id INTEGER REFERENCES genre(genre_id),
    composer VARCHAR(200),
    milliseconds INTEGER,
    bytes BIGINT,
    unit_price DECIMAL(10,2) NOT NULL);

-- 8. Playlist Table
CREATE TABLE playlist (
    playlist_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL);

-- 9. Playlist Track Junction Table
CREATE TABLE playlist_track (
    playlist_id INTEGER REFERENCES playlist(playlist_id),
    track_id INTEGER REFERENCES track(track_id),
    PRIMARY KEY (playlist_id, track_id));

-- 10. Invoice Table
CREATE TABLE invoice (
    invoice_id INTEGER PRIMARY KEY,
    customer_id INTEGER REFERENCES customer(customer_id),
    invoice_date DATE NOT NULL,
    billing_address VARCHAR(100),
    billing_city VARCHAR(100),
    billing_state VARCHAR(100),
    billing_country VARCHAR(100),
    billing_postal_code VARCHAR(20),
    total DECIMAL(10,2) NOT NULL);

-- 11. Invoice Line Table
CREATE TABLE invoice_line (
    invoice_line_id INTEGER PRIMARY KEY,
    invoice_id INTEGER REFERENCES invoice(invoice_id),
    track_id INTEGER REFERENCES track(track_id),
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INTEGER NOT NULL);