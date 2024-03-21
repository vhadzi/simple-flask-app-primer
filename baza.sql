--
-- File generated with SQLiteStudio v3.3.3 on sub mar 2 00:41:05 2024
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: cenovnik
DROP TABLE IF EXISTS cenovnik;
CREATE TABLE cenovnik (id INTEGER PRIMARY KEY AUTOINCREMENT, stavkamenija INTEGER REFERENCES items (id) ON DELETE CASCADE ON UPDATE CASCADE, kolicina VARCHAR (10) NOT NULL COLLATE UNICODE, cena NUMERIC (6, 2) NOT NULL);
INSERT INTO cenovnik (id, stavkamenija, kolicina, cena) VALUES (1, 1, '2 kom.', 250);
INSERT INTO cenovnik (id, stavkamenija, kolicina, cena) VALUES (2, 2, '1 kom.', 250);
INSERT INTO cenovnik (id, stavkamenija, kolicina, cena) VALUES (3, 6, '1 kom', 120);
INSERT INTO cenovnik (id, stavkamenija, kolicina, cena) VALUES (4, 5, '0,25l', 150);
INSERT INTO cenovnik (id, stavkamenija, kolicina, cena) VALUES (5, 7, '0,5dl', 150);
INSERT INTO cenovnik (id, stavkamenija, kolicina, cena) VALUES (6, 4, '250g', 250);
INSERT INTO cenovnik (id, stavkamenija, kolicina, cena) VALUES (7, 8, '2dl', 100);

-- Table: items
DROP TABLE IF EXISTS items;
CREATE TABLE items (id INTEGER PRIMARY KEY AUTOINCREMENT, naziv VARCHAR (30) NOT NULL COLLATE UNICODE, vrsta VARCHAR (10) NOT NULL COLLATE UNICODE);
INSERT INTO items (id, naziv, vrsta) VALUES (1, 'Sarma', 'hrana');
INSERT INTO items (id, naziv, vrsta) VALUES (2, 'Komplet lepinja', 'hrana');
INSERT INTO items (id, naziv, vrsta) VALUES (3, 'Supa (kokošja ili juneæa)', 'hrana');
INSERT INTO items (id, naziv, vrsta) VALUES (4, 'Pasulj sa slaninom', 'hrana');
INSERT INTO items (id, naziv, vrsta) VALUES (5, 'Coca-Cola, flasšica', 'piæe');
INSERT INTO items (id, naziv, vrsta) VALUES (6, 'Kafa (domaæa) sa ratlukom', 'piæe');
INSERT INTO items (id, naziv, vrsta) VALUES (7, 'Vinjak', 'piæe');
INSERT INTO items (id, naziv, vrsta) VALUES (8, 'Sok na èašu (crni ili žuti)', 'piæe');

-- Table: radnamesta
DROP TABLE IF EXISTS radnamesta;
CREATE TABLE radnamesta (ID INTEGER PRIMARY KEY AUTOINCREMENT, Naziv VARCHAR (30) NOT NULL COLLATE UNICODE);
INSERT INTO radnamesta (ID, Naziv) VALUES (1, 'Šef sale');
INSERT INTO radnamesta (ID, Naziv) VALUES (2, 'Konobar');
INSERT INTO radnamesta (ID, Naziv) VALUES (3, 'Šanker');
INSERT INTO radnamesta (ID, Naziv) VALUES (4, 'Menadžer');
INSERT INTO radnamesta (ID, Naziv) VALUES (5, 'Kuvar');

-- Table: zaposleni
DROP TABLE IF EXISTS zaposleni;
CREATE TABLE zaposleni (id INTEGER PRIMARY KEY AUTOINCREMENT, ime VARCHAR (30) NOT NULL COLLATE UNICODE, prezime VARCHAR (30) NOT NULL COLLATE UNICODE, datum_rodj DATE NOT NULL, adresa VARCHAR (50) NOT NULL COLLATE UNICODE, radnomesto INTEGER REFERENCES radnamesta (ID) ON DELETE SET NULL ON UPDATE CASCADE);
INSERT INTO zaposleni (id, ime, prezime, datum_rodj, adresa, radnomesto) VALUES (1, 'Keba', 'Kraba', '1942-11-30', 'Kafana "Kod Keba Krabe"', 4);
INSERT INTO zaposleni (id, ime, prezime, datum_rodj, adresa, radnomesto) VALUES (2, 'Bob', 'Kockalone', '1986-07-14', '124 Konè Strit', 5);
INSERT INTO zaposleni (id, ime, prezime, datum_rodj, adresa, radnomesto) VALUES (3, 'Lignjoslav', 'Pipak', '1986-08-15', '122 Konè Strit', 1);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
