cat > /tmp/vul.sql << 'EOF'
USE TheSixthString;
SET FOREIGN_KEY_CHECKS=0;
SET UNIQUE_CHECKS=0;
SET SQL_SAFE_UPDATES=0;

-- RESET ALLES
DELETE FROM Bestelregel;
DELETE FROM Bestelling;
DELETE FROM Product;
DELETE FROM Categorie;
DELETE FROM Klant;
DELETE FROM RetourRedenType;
ALTER TABLE Klant AUTO_INCREMENT = 1;
ALTER TABLE Categorie AUTO_INCREMENT = 1;
ALTER TABLE Product AUTO_INCREMENT = 1;

-- 1. KLANTEN (FORCE ID's - Joris = 3)
SET @row_number = 0;
INSERT INTO Klant (klant_id, voornaam, achternaam, email, telefoon, straat, postcode, huisnummer, toevoeging, plaats, wachtwoord_hash, account_status) VALUES
(1, 'Kenneth', 'Busser', 'kenneth@windesheim.nl', '0612345678', 'Campus', '1234AB', 2, '', 'Zwolle', MD5('Welkom01!'), 'actief'),
(2, 'Joris', 'Weber', 'joris@windesheim.nl', '0612345678', 'Campus', '1234AB', 3, 'A', 'Amersfoort', MD5('Welkom01!'), 'actief'),
(3, 'Mustafa', 'Al Tamimi', 'mustafa@windesheim.nl', '0612345678', 'Campus', '1234AB', 4, 'C', 'Amsterdam', MD5('Welkom01!'), 'actief'),
(4, 'Frank', 'Otten', 'frank@windesheim.nl', '0612345678', 'Campus', '1234AB', 5, 'H', 'Rotterdam', MD5('Welkom01!'), 'actief'),
(5, 'Mark', 'de Vries', 'mark@windesheim.nl', '0612345678', 'Campus', '1234AB', 6, '', 'Den Haag', MD5('Welkom01!'), 'actief'),
(6, 'Test', 'User', 'test@gebruiker.nl', '0612345678', 'Teststrat', '8866TT', 66, '', 'Teststad', MD5('Welkom01!'), 'actief');

-- 2. RETOUR REDENEN (voor Retour.php)
INSERT INTO RetourRedenType (reden_id, naam) VALUES 
(1, 'Te klein/groot'), (2, 'Fout besteld'), (3, 'Beschadigd'), (4, 'Niet geleverd'), (5, 'Andere');

-- 3. CATEGORIEËN
INSERT INTO Categorie (categorie_id, naam) VALUES 
(1, 'elektrische gitaren'),
(2, 'semi akoestische gitaar'),
(3, 'kindergitaar'),
(4, 'Accessoires'),
(5, 'Reisgitaar');

-- 4. PRODUCTEN (10 producten)
INSERT INTO Product (product_id, naam, merk, beschrijving, prijs, stock_quantity, afbeelding_url, video_url, categorie_id) VALUES
(1, 'Fazley FST118 Sunburst', 'Fazley', 'Elektrische gitaar', 79.00, 5, '/img/fazley.jpg', '', 1),
(2, 'Aria 718-MK2 Brooklyn', 'Aria', 'Elektrische gitaar', 478.00, 3, '/img/aria.jpg', '', 1),
(3, 'LaPaz C50N naturel', 'LaPaz', 'Klassieke gitaar', 249.00, 1, '/img/lapaz.jpg', '', 2),
(4, 'Angel Lopez EC3000CN', 'Angel Lopez', 'Semi-akoestisch', 324.00, 2, '/img/angel.jpg', '', 2),
(5, 'Cascha CGC200 3/4', 'Cascha', 'Kinder gitaar', 208.00, 10, '/img/cascha1.jpg', '', 3),
(6, 'Cascha HH2354 1/2', 'Cascha', 'Kinder gitaar', 98.00, 15, '/img/cascha2.jpg', '', 3),
(7, 'Ernie Ball Strap', 'Ernie Ball', 'Gitaarband', 29.00, 50, '/img/strap.jpg', '', 4),
(8, 'Innox IGS 07', 'Innox', 'Gitaarstandaard', 12.70, 32, '/img/standaard.jpg', '', 4),
(9, 'Fazley W55 Reisgitaar', 'Fazley', 'Reisgitaar bruin', 61.00, 1, '/img/reis1.jpg', '', 5),
(10, 'LaPaz Roze 3/4', 'LaPaz', 'Roze reisgitaar', 59.00, 2, '/img/reis2.jpg', '', 5);

-- 5. BESTELLING (Mustafa ID=3)
INSERT INTO Bestelling (bestelling_id, klant_id, besteldatum, status, totaalbedrag) VALUES 
(1, 3, '2025-12-29 10:00:00', 'nog niet betaald', 250.00);

-- 6. BESTELREGEL
INSERT INTO Bestelregel (bestelregel_id, bestelling_id, product_id, aantal, prijs_per_stuk) VALUES 
(1, 1, 1, 3, 45.99);

SET FOREIGN_KEY_CHECKS=1;

-- FINAL CHECK
SELECT 'KLAAR!' as Status, 
(SELECT COUNT(*) FROM Klant) as Klanten,
(SELECT COUNT(*) FROM Bestelling WHERE klant_id=3) as MustafaBestellingen;
EOF
