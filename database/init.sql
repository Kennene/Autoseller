CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    amount INT NOT NULL DEFAULT 1 CHECK (amount >= 1) ,
    photo bytea,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0.00),
    description TEXT DEFAULT NULL,
    date_insert TIMESTAMP DEFAULT current_timestamp,
    date_update TIMESTAMP DEFAULT current_timestamp
);

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    login VARCHAR(100) NOT NULL UNIQUE,
    fullname VARCHAR(100),
    password_hash VARCHAR(100) NOT NULL,
    date_insert TIMESTAMP DEFAULT current_timestamp,
    date_update TIMESTAMP DEFAULT current_timestamp
);

CREATE TABLE IF NOT EXISTS acl (
    id SERIAL PRIMARY KEY,
    description TEXT NOT NULL UNIQUE,
    date_insert TIMESTAMP DEFAULT current_timestamp,
    date_update TIMESTAMP DEFAULT current_timestamp
);

INSERT INTO acl (description)
VALUES
    ('Ogladanie produktow w bazie danych'),
    ('Dodawanie produktow do bazy'),
    ('Edycja istniejących produktow'),
    ('Usuwanie produktow z bazy danych'),
    ('Admin Access');

CREATE TABLE IF NOT EXISTS users_acl (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    acl_id INT DEFAULT 0,
    date_insert TIMESTAMP DEFAULT current_timestamp,
    date_update TIMESTAMP DEFAULT current_timestamp,

    CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES users(id)
        MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT acl_fk FOREIGN KEY (acl_id) REFERENCES acl(id)
        MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);