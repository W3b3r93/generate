cat > /tmp/vul.sql << 'EOF'
USE TheSixthString;
SET FOREIGN_KEY_CHECKS=0;
SET UNIQUE_CHECKS=0;

-- RESET
TRUNCATE TABLE Bestelregel;
TRUNCATE TABLE Bestelling;
TRUNCATE TABLE Product;
TRUNCATE TABLE Categorie;
TRUNCATE TABLE Klant;

-- 1. KLANTEN (MD5 wachtwoorden)
INSERT INTO Klant (voornaam, achternaam, email, telefoon, straat, postcode, huisnummer, toevoeging, plaats, wachtwoord_hash, account_status) VALUES
('Kenneth', 'Busser', 'kenneth@windesheim.nl', '0612345678', 'Campus', '1234AB', 2, '', 'Zwolle', MD5('Welkom01!'), 'actief'),
('Joris', 'Weber', 'joris@windesheim.nl', '0612345678', 'Campus', '1234AB', 3, 'A', 'Amersfoort', MD5('Welkom01!'), 'actief'),
('Mustafa', 'Al Tamimi', 'mustafa@windesheim.nl', '0612345678', 'Campus', '1234AB', 4, 'C', 'Amsterdam', MD5('Welkom01!'), 'actief'),
('Frank', 'Otten', 'frank@windesheim.nl', '0612345678', 'Campus', '1234AB', 5, 'H', 'Rotterdam', MD5('Welkom01!'), 'actief'),
('Mark', 'de Vries', 'mark@windesheim.nl', '0612345678', 'Campus', '1234AB', 6, '', 'Den Haag', MD5('Welkom01!'), 'actief'),
('Test', 'User', 'test@gebruiker.nl', '0612345678', 'Teststrat', '8866TT', 66, '', 'Teststad', MD5('Welkom01!'), 'actief');

-- 2. CATEGORIEËN
INSERT INTO Categorie (naam) VALUES
('elektrische gitaren'),
('semi akoestische gitaar'),
('kindergitaar'),
('Accessoires'),
('Reisgitaar');

-- 3. PRODUCTEN
INSERT INTO Product (naam, merk, beschrijving, prijs, stock_quantity, afbeelding_url, categorie_id) VALUES
('Fazley FST118', 'Fazley', 'Sunburst elektrische gitaar', 79.00, 5, '/img/fazley.jpg', 1),
('Aria 718-MK2', 'Aria', 'Brooklyn elektrische gitaar', 478.00, 3, '/img/aria.jpg', 1),
('LaPaz C50N', 'LaPaz', 'Klassieke gitaar naturel', 249.00, 1, '/img/lapaz.jpg', 2),
('Angel Lopez EC3000', 'Angel Lopez', 'Elekstisch-akoestisch', 324.00, 2, '/img/angel.jpg', 2),
('Cascha CGC200', 'Cascha', 'Kinder gitaar 3/4', 208.00, 10, '/img/cascha1.jpg', 3);

-- 4. BESTELLING (Mustafa = klant_id 3)
INSERT INTO Bestelling (klant_id, besteldatum, status, totaalbedrag) VALUES
(3, '2025-12-29 10:00:00', 'nog niet betaald', 250.00);

-- 5. BESTELREGEL
INSERT INTO Bestelregel (bestelling_id, product_id, aantal, prijs_per_stuk) VALUES
(1, 1, 3, 45.99);

SET FOREIGN_KEY_CHECKS=1;

-- CHECK
SELECT 'STATUS' as Check, COUNT(*) as Aantal FROM Klant UNION 
SELECT 'Categorieën', COUNT(*) FROM Categorie UNION 
SELECT 'Producten', COUNT(*) FROM Product UNION 
SELECT 'Bestellingen', COUNT(*) FROM Bestelling UNION 
SELECT 'Bestelregels', COUNT(*) FROM Bestelregel;
EOF
