cat > /tmp/vul.sql << 'EOF'
USE TheSixthString;

-- OUDE MYSQL COMPATIBEL - aparte TRUNCATE per tabel
DELETE FROM Bestelregel;
DELETE FROM Bestelling;
DELETE FROM Product;
DELETE FROM Categorie;
DELETE FROM Klant;
ALTER TABLE Klant AUTO_INCREMENT = 1;
ALTER TABLE Categorie AUTO_INCREMENT = 1;
ALTER TABLE Product AUTO_INCREMENT = 1;

-- KLANTEN (MD5 Welkom01!)
INSERT INTO Klant (voornaam, achternaam, email, telefoon, straat, postcode, huisnummer, toevoeging, plaats, wachtwoord_hash, account_status) VALUES
('Mustafa', 'Al Tamimi', 'mustafa@windesheim.nl', '0612345678', 'Campus', '1234AB', 4, 'C', 'Amsterdam', MD5('Welkom01!'), 'actief');

-- CATEGORIE
INSERT INTO Categorie (naam) VALUES ('elektrische gitaren');

-- PRODUCT
INSERT INTO Product (naam, merk, beschrijving, prijs, stock_quantity, afbeelding_url, categorie_id) VALUES 
('Fazley FST118', 'Fazley', 'Sunburst gitaar', 79.00, 5, '/img/fazley.jpg', 1);

-- BESTELLING
INSERT INTO Bestelling (klant_id, besteldatum, status, totaalbedrag) VALUES 
(1, '2025-12-29 10:00:00', 'nog niet betaald', 250.00);

-- BESTELREGEL
INSERT INTO Bestelregel (bestelling_id, product_id, aantal, prijs_per_stuk) VALUES 
(1, 1, 3, 45.99);

-- RETOUR REDENEN (voor Retour.php)
INSERT IGNORE INTO RetourRedenType (naam) VALUES 
('Te klein/groot'), ('Fout besteld'), ('Beschadigd');

SELECT 'SUCCESS - Klaar voor Retour.php test!' as Status;
EOF
